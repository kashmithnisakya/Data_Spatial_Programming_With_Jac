import: py json;
import: py from openai, OpenAI;
import: py os;
import:py from dotenv, load_dotenv;


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

glob llm = llm();



can 'genarate summery to the given date'
    genarate_summery_content(when: 'date that memory happend': str) -> 'summery': str by llm();


node memory {
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


walker regenerate_graph {
    has file_name: str;

    can load_file with `root entry;
}

walker genarate_summery{
    can visit_memory with `root entry;

    can replace_summery with memory entry;
}


with entry {
    load_dotenv();

    client = OpenAI();

    file_name: str = "memory_dump.json";

    root spawn regenerate_graph(file_name = file_name);

    root spawn genarate_summery();

    print("\n######### dotgen code #########\n");
    print(dotgen(root));
}