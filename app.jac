import:py uuid;


# create a node to store the memories
node memory {
    has id: str;
    has summary: str;
    has when: str;
    has who: str;
    has where: str;
    has what: str; 
}


# create a walker to go through the memories
walker add_memory{
    has id: str;
    has summary: str;
    has when: str;
    has who: str;
    has where: str;
    has what: str;

    # create a new node 
    can create_node with `root entry;

    # connet related nodes each other 
    can connect_related_nodes with `root entry;

}


walker related_memory{


}


edge related {
    has when: str = "";
}


with entry:__main__{
    # node 01
    root spawn add_memory(
                    id = uuid.uuid4().hex,
                    summary="tetsing memory node 01",
                    when="2024-04-30",
                    who="kashmith",
                    where="university of moratuwa",
                    what="creat a node"
    );

    # node 01
    root spawn add_memory(
                    id = uuid.uuid4().hex,
                    summary="tetsing memory node 02",
                    when="2024-04-30",
                    who="nisakya",
                    where="university of moratuwa",
                    what="creat a node"
    );

    # node 03
    root spawn add_memory(
                    id = uuid.uuid4().hex,
                    summary="tetsing memory node 03",
                    when="2024-05-01",
                    who="kashmith",
                    where="university of moratuwa",
                    what="creat a node"
    );
}
