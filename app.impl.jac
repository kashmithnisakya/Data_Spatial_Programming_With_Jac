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
    print("\nunique dates:",dates);

    # connect all the related nodes to the nodes with the same date
    for related_dates in dates{
        print("\n#### for date:",related_dates);
        related_nodes = [-->](?when == related_dates);
        print("\n#### related nodes:",related_nodes);

        if len(related_nodes) >1{
            number_of_realated_nodes = len(related_nodes);
            print("\n#### number of related nodes:",number_of_realated_nodes);
            
            for i in range(number_of_realated_nodes){
                for j in range(i+1,number_of_realated_nodes){
                        related_nodes[i] +:related:when="hi":+> related_nodes[j];
                        print(f"created edge between {related_nodes[i].id} and {related_nodes[j].id}");
                }
            }
        }
    }  
}
