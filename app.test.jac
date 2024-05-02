test test_add_memory_walker{

    created_node = root spawn add_memory(
                    id = uuid.uuid4().hex,
                    summary="tetsing memory node 01",
                    when="2024-04-30",
                    who="kashmith",
                    where="university of moratuwa",
                    what="creat a node"
    );

    assert created_node.summary=="tetsing memory node 01";
    assert created_node.when=="2024-04-30";
    assert created_node.who=="kashmith";
    assert created_node.where=="university of moratuwa";
    assert created_node.what=="creat a node";


}



test test_get_related_memory_walker{

    root spawn add_memory(
                    id = uuid.uuid4().hex,
                    summary="tetsing memory node 02",
                    when="2024-04-30",
                    who="nisakya",
                    where="university of moratuwa",
                    what="creat a node"
    );

    
    related_id = root spawn related_memory(); 
    print(related_id.check_related_nodes);
}