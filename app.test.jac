test test_add_memory_walker{

    walker_obj = root spawn add_memory(
                    id = "105570e475bd42799d79a8d047bc4d6a",
                    summary="tetsing memory node 01",
                    when="2024-04-30",
                    who="kashmith",
                    where="university of moratuwa",
                    what="creat a node"
    );

    assert walker_obj.created_node[0].id=="105570e475bd42799d79a8d047bc4d6a";
    assert walker_obj.created_node[0].summary=="tetsing memory node 01";
    assert walker_obj.create_node[0].when=="2024-04-30";
    assert walker_obj.create_node[0].who=="kashmith";
    assert walker_obj.create_node[0].where=="university of moratuwa";
    assert walker_obj.create_node[0].what=="creat a node";
}



test test_get_related_memory_walker{

    root spawn add_memory(
                    id = "67640daea0584c758d856b057ccc7637",
                    summary="tetsing memory node 02",
                    when="2024-04-30",
                    who="nisakya",
                    where="university of moratuwa",
                    what="creat a node"
    );

    
    node_id:str = root spawn related_memory(); 
    assert node_id.id == "67640daea0584c758d856b057ccc7637" or "105570e475bd42799d79a8d047bc4d6a";
}