using System;
using System.Collections.Generic;
using RosMessageTypes.Geometry;
using RosMessageTypes.Moveit;
using RosMessageTypes.Std;
using RosMessageTypes.Shape;
using Unity.Robotics.ROSTCPConnector;
using Unity.Robotics.ROSTCPConnector.ROSGeometry;
using UnityEngine;

public class ObjectDestinationPublisher : MonoBehaviour
{
    [SerializeField]
    string m_TopicName1 = "/collision_object";

    [SerializeField]
    GameObject m_Table;

    [SerializeField]
    public GameObject m_GltfObject;

    [SerializeField]
    public GameObject m_Object; 

    
    [SerializeField]
    Vector3 m_CustomScale = new Vector3(1.0f, 1.0f, 1.0f);

    // ROS Connector
    ROSConnection m_Ros;

    void Start()
    {
        m_Ros = ROSConnection.GetOrCreateInstance();
        m_Ros.RegisterPublisher<CollisionObjectMsg>(m_TopicName1);
    }

    public void PublishTable()
    {
        var tablePose = new PoseMsg
        {
            position = m_Table.transform.position.To<FLU>(),
            orientation = m_Table.transform.rotation.To<FLU>()
        };
        tablePose.position.z -= 0.4; 
        var tableCollisionObject = new CollisionObjectMsg
        {
            header = new HeaderMsg
            {
                frame_id = "world" 
            },
            id = "table",
            operation = CollisionObjectMsg.ADD, 
            primitive_poses = new List<PoseMsg> { tablePose }.ToArray(),
            primitives = new List<SolidPrimitiveMsg>
            {
                new SolidPrimitiveMsg
                {
                    type = SolidPrimitiveMsg.BOX,
                    dimensions = new double[] { 5, 5, 0.64 } 
                }
            }.ToArray()
        };

        m_Ros.Publish(m_TopicName1, tableCollisionObject);
        Debug.Log("Published table collision object.");
    }

    public void PublishObject()
    {
        if (m_GltfObject == null)
        {
            Debug.LogWarning("GLTF Object is not assigned.");
            return;
        }

        MeshFilter[] meshFilters = m_GltfObject.GetComponentsInChildren<MeshFilter>();
        foreach (MeshFilter meshFilter in meshFilters)
        {
            Mesh unityMesh = meshFilter.sharedMesh;
            if (unityMesh != null)
            {
                Quaternion adjustedRotation = meshFilter.transform.rotation * Quaternion.Euler(0, 270, 270); 
                Vector3 adjustedScale = Vector3.Scale(meshFilter.transform.lossyScale, m_CustomScale); 

                var objectPose = new PoseMsg
                {
                    position = meshFilter.transform.position.To<FLU>(),
                    orientation = adjustedRotation.To<FLU>()
                };

                var objectCollisionObject = new CollisionObjectMsg
                {
                    header = new HeaderMsg
                    {
                        frame_id = "world"
                    },
                    id = "gltf_object",
                    operation = CollisionObjectMsg.ADD,
                    meshes = new MeshMsg[] { ConvertUnityMeshToROS(unityMesh, adjustedScale) },
                    mesh_poses = new PoseMsg[] { objectPose }
                };

                m_Ros.Publish(m_TopicName1, objectCollisionObject);
                Debug.Log($"Published GLTF object collision object from {meshFilter.name} with scale {m_CustomScale}.");
            }
        }
    }

    public void PublishObstacle()
    {
        var objectPose = new PoseMsg
        {
            position = m_Object.transform.position.To<FLU>(),
            orientation = m_Object.transform.rotation.To<FLU>()
        };
        objectPose.position.z -= 0; 

        var objectCollisionObject = new CollisionObjectMsg
        {
            header = new HeaderMsg
            {
                frame_id = "world"
            },
            id = "object", 
            operation = CollisionObjectMsg.ADD,
            primitive_poses = new List<PoseMsg> { objectPose }.ToArray(),
            primitives = new List<SolidPrimitiveMsg>
            {
                new SolidPrimitiveMsg
                {
                    type = SolidPrimitiveMsg.BOX,
                    dimensions = new double[] { 0.09, 1, 1 } 
                }
            }.ToArray()
        };

        m_Ros.Publish(m_TopicName1, objectCollisionObject);
        Debug.Log("Published object collision object.");
    }

    // Convert Unity mesh to ROS MeshMsg with scale adjustment
    private MeshMsg ConvertUnityMeshToROS(Mesh mesh, Vector3 scale)
    {
        PointMsg[] vertices = new PointMsg[mesh.vertexCount];
        for (int i = 0; i < mesh.vertexCount; i++)
        {
            Vector3 vertex = Vector3.Scale(mesh.vertices[i], scale); 
            vertices[i] = new PointMsg(vertex.x, vertex.y, vertex.z);
        }

        int[] triangles = mesh.triangles;
        MeshTriangleMsg[] rosTriangles = new MeshTriangleMsg[triangles.Length / 3];
        for (int i = 0; i < triangles.Length; i += 3)
        {
            rosTriangles[i / 3] = new MeshTriangleMsg
            {
                vertex_indices = new uint[] 
                { 
                    (uint)triangles[i], 
                    (uint)triangles[i + 1], 
                    (uint)triangles[i + 2] 
                }
            };
        }

        return new MeshMsg
        {
            vertices = vertices,
            triangles = rosTriangles
        };
    }
}
