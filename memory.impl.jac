:walker:regenerate_graph:can:load_file{
        content = json.load(open(self.file_name, "r"));

        filteed_content = content["report"];

        for item in filteed_content{
            node_content = item["context"];
            memory_date:str = "";
            if (type(node_content['when'])==list){
                memory_date = node_content['when'][0];
                }
            else{
                memory_date = node_content['when'];
                }

            
            here ++> memory(
                summary=node_content['summary'],
                when= memory_date,
                who=node_content['who'],
                where=node_content['where'],
                what=node_content['what'],
                natural_when=node_content['natural_when'],
                emotion=node_content['emotion'],
                created_at=node_content['created_at'],
                updated_at=node_content['updated_at'],
                image_urls=node_content['image_urls'],
                node_id=node_content['node_id']
                );
            }
        }

:walker:filter_memory:can:visit_memory{
    all_nodes = [-->];
    for n in all_nodes{
        if n.when not in self.dates{
            self.dates.append(n.when);
        }
    }
}


:can:process_dates(date_list:list) -> list {
    # Convert strings to datetime objects
    date_objects = [datetime.strptime(date, '%Y-%m-%d') for date in date_list];

    # Sort the list of datetime objects
    sorted_dates = sorted(date_objects, reverse=True);

    # Convert datetime objects back to strings if needed
    sorted_dates_strings = [date.strftime('%Y-%m-%d') for date in sorted_dates];

    # print(sorted_dates_strings);
    return sorted_dates_strings;
}


:walker:gererate_summery:can:visit_memory{
    counter: int = 0;
    for date in self.date_list{
        filter_date = [-->](?when==date);
        for memory in filter_date{
            if counter<5{
                counter += 1;
                self.list_of_summery.append(memory.summary);
            }
        }
    }
}
    
