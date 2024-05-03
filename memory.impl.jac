:walker:regenerate_graph:can:load_file{
        content = json.load(open(self.file_name, "r"));

        filteed_content = content["report"];

        for item in filteed_content{
            node_content = item["context"];
            
            here ++> memory(
                summary=node_content['summary'],
                when=node_content['when'],
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

:walker:genarate_summery:can:visit_memory{
    visit [-->];
}


:walker:genarate_summery:can:replace_summery{
    date: list = here.when;
    new_summery = genarate_summery_content(when=date);
    here.summary = new_summery;
}