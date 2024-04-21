Table words;
String words_file = "verbs.tsv";
Integer line = 0;
Integer list_length;

void setup() {
  words = loadTable(words_file);
  list_length = words.getRowCount();
  words.removeTokens("\"");
  
  size(1920,1080);
  background(255);

}

void draw() {
  background(255);
  
  line = frameCount - 1;
  
  if (line < list_length) {
    var word_ru = words.getString(line, 0);
    var word_he_nekudot = words.getString(line, 1);
    var word_he = words.getString(line, 2);
    var paal = words.getString(line, 3);
    var dict_form = words.getString(line, 4);
    var root = words.getString(line, 5);
    
    
    var n = createFont("ArialHebrewScholar", 180*2, true);
    textFont(n);
    fill(240);
    textAlign(CENTER, CENTER);
    text(word_he_nekudot, width/2, height/2 - 50);
    
    var f = createFont("ArialHebrewScholar", 180*2, true);
    textFont(f);
    fill(0);
    textAlign(CENTER, CENTER);
    text(word_he, width/2, height/2 - 50);

    var d = createFont("ArialHebrewScholar", 50*2, true);
    textFont(d);
    fill(128);
    textAlign(CENTER, CENTER);
    text(dict_form, width/2 - 250, height/2 + 250);
    
    var r = createFont("ArialHebrewScholar", 50*2, true);
    textFont(r);
    fill(128);
    textAlign(CENTER, CENTER);
    text(root, width/2 + 250, height/2 + 250);


    var t = createFont("Verdana", 24*3, true);
    textFont(t);
    fill(240);
    textAlign(CENTER, CENTER);
    text(word_ru, width/2, height/2 + 400);

    saveFrame("#####.jpg");  
    
    // delay(1000);
  }

}
