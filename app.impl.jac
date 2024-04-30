:walker:add_memory:can:create_node{
    # creating new node 
    here ++> memory(
        id = self.id,
        summary = self.summary,
        when = self.when,
        who = self.who,
        where = self.where,
        what = self.what
        );
        print("\n### node is created with id:",self.id);
}

:walker:add_memory:can:connect_related_nodes{
    # get all the unique dates from the nodes
    all_nodes = [-->];
    dates: list = [];
    for i in all_nodes{
        if i.when not in dates{
            dates.append(i.when); 
        }
    }
    # print("\nunique dates:",dates);

    # connect all the related nodes to the nodes with the same date
    for related_date in dates{
        print("### for unique date:",related_date);
        related_nodes = [-->](?when == related_date);
        number_of_realated_nodes = len(related_nodes);
        print("### number of related nodes:",number_of_realated_nodes);

        if number_of_realated_nodes >1{
            for i in range(number_of_realated_nodes){
                for j in range(i+1,number_of_realated_nodes){
                    
                    if ([related_nodes[i] -:related:when==related_date:-> related_nodes[j]]){
                        print("### edge is already there!");
                    }
                    else{
                        related_nodes[i] +:related:when=related_date:+> related_nodes[j];
                        print(f"$$$ created special edge between {related_nodes[i].id} and {related_nodes[j].id}");
                        }
                }
            }
        }
    }  
}


:walker:related_memory:can:travls_graph{
    # get all the unique dates from the nodes
    all_nodes =  [-->];
    visit all_nodes;
    }


:walker:related_memory:can:check_related_nodes{
    nodes = [here-:related:when=="2024-04-30":->];
    if nodes{
        print("\nnodes with related edges:",nodes);
        return nodes;
    }
}

