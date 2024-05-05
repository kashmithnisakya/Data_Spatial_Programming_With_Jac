import: py json;
import: py from openai, OpenAI;
import: py os;
import:py from dotenv, load_dotenv;
import: py from datetime, datetime;


obj llm {
    can __infer__(meaning_in: str, **kwargs: dict) {
       
       return client.chat.completions.create(
                  model="gpt-4",
                  messages=[
                     {"role": "system", "content": "You are a helpful assistant."},
                     {"role": "user", "content": meaning_in}
                       ],
                   temperature=0.7
                    ).choices[0].message.content;
    }
}

glob llm_1 = llm();


can 'genarate summery using given list of small summeries'
    genarate_summery_content(summery: 'list of samll summeies': list) -> 'summery of all of the samll summeries': str by llm_1();


can process_dates(date_list:list) -> list;

node memory {
    has summary: str;
    has when: str;
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


walker regenerate_graph {
    has file_name: str;

    can load_file with `root entry;
}

walker filter_memory {
    has dates: list =[];

    can visit_memory with `root entry;
}


walker gererate_summery{
    has date_list: list;
    has list_of_summery: list = [];

    can visit_memory with `root entry;

}


with entry {
    load_dotenv();

    client = OpenAI();

    file_name: str = "memory_dump.json";

    root spawn regenerate_graph(file_name = file_name);

    date_list:list = root spawn filter_memory();
    dates:list = process_dates(date_list.dates);

    summery_list = root spawn gererate_summery(date_list = dates);

    summery = genarate_summery_content(summery = summery_list.list_of_summery);
    print("Summery of the last five momories:\n");
    print(summery);

    print("\n######### dotgen code #########\n");
    print(dotgen(root));
}