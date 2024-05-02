import:py json;


 node memory{
        has summary: str; 
        has when: list;
        has who: list;
        has where: list;
        has what: list;
        has natural_when: list;
        has emotion: str;
        has created_at: str;
        has updated_at: str;
        has image_urls: list;
        has node_id: str;
        }



walker regenerate_graph{
    has file_name:str;

    can load_file with `root entry;
    
    }


with entry{
    file_name:str = "memory_dump.json";
    
    root spawn regenerate_graph(file_name=file_name);

    print("\n######### dotgen code #########\n");
    print(dotgen(root));

}