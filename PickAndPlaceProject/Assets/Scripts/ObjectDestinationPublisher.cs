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
    public GameObject m_Object;

    // ROS Connector
    ROSConnection m_Ros;

    void Start()
    {
        m_Ros = ROSConnection.GetOrCreateInstance();
        m_Ros.RegisterPublisher<CollisionObjectMsg>(m_TopicName1);
    }

    // Gửi thông tin của bàn
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

        // Gửi bàn
        m_Ros.Publish(m_TopicName1, tableCollisionObject);
        Debug.Log("Published table collision object.");
    }


    public void PublishObject()
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
            id = "object", // ID duy nhất cho đối tượng
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
}
