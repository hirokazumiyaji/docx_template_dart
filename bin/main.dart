import 'package:DocxTemplate/DocxTemplate.dart';

main(List<String> arguments) {
  DocxTemplate docx = DocxTemplate();
  docx.load("template.docx");
  Content c = Content("");
  c.sub = Map();
  c.sub["myKey"] = TextContent("myKey", "aaaa privet this is first key");
  c.sub["myValue"] = TextContent("myKey", "aaaa privet this is first key");
  c.sub["table"] = TableContent("table", [
    RowContent("", {"key1":TextContent("key1", "паша"), "key2":TextContent("key2", "Манюнин")}),
    RowContent("", {"key1":TextContent("key1", "саша"), "key2":TextContent("key2", "Манюнин")}),
    RowContent("", {"key1":TextContent("key1", "Привет"), "key2":TextContent("key2", "Мир"), "key2":TextContent("key3", "Водка")})
  ]);

  var tc1  = TextContent("value", "a1test");
  tc1.sub["listnested"] = ListContent("listnested", [TextContent("value", "aaaaa"), TextContent("value", "bbbb")]);
  c.sub["list"] = ListContent("list", [tc1, TextContent("value", "b"), TextContent("value", "c")]);

  /*
  List<Content> list = List();
  list.add(TextContent("myKey", "aaaa privet this is first key"));
  list.add(TextContent("myValue", "aaaa privet this is second value"));
  list.add(TableContent("table", [RowContent("", {"key1":"паша"}));
  [
    {"key1":TextContent("", "Паша"), "key2":TextContent("", "Манюнин")},
  {"key1":TextContent("", "Саша"), "key2":TextContent("", "Журавлев")},
  {"key1":TextContent("", "Привет"), "key2":TextContent("", "Мир"), "key3":TextContent("", "Труд")}]));
  list.add(ListContent("list", [TextContent("", "a"), TextContent("", "b"), TextContent("", "c"),
  ListContent("inner", [TextContent("", "Илья"), TextContent("", "Евгеньевич"), TextContent("", "Ермаков")])]));
  */
  docx.generate(c);
  docx.save();
}
