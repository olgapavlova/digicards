// Screen configuration
Integer SCREEN_WIDTH = 800;
Integer SCREEN_HEIGHT = 600;

// Dictionary configuration
String DICTIONARY_FILE = "verbs.tsv";
Table dictionary;
Integer dictionary_length;

// Table columns configuration
Integer T_CODE      = 0; // Latin code for pictures and Pealim dictionary
Integer T_PICTURE   = 1; // True, if there is a picture for this word
Integer T_TRANSLATE = 2; // Meaning in your language
Integer T_NEKUDOT   = 3; // In Hebrew, with vowels (nekudot)
Integer T_VERB      = 4; // In Hebrew, without vowels (pure word)
Integer T_BINYAN    = 5; // Binyan
Integer T_PAST3     = 6; // Past, 3rd, he (dictionary form)
Integer T_ROOT      = 7; // Root (dots as dividers)

// Style
String FONT_HEBREW    = "ArialHebrewScholar";
String FONT_TRANSLATE = "Verdana";
Integer FH_MAIN  = round(SCREEN_HEIGHT/4);  // Font height: main, sub, and small
Integer FH_SUB   = round(SCREEN_HEIGHT/12);
Integer FH_SMALL = round(SCREEN_HEIGHT/18);
Integer PICTURE_HEIGHT = round(SCREEN_HEIGHT/4);
Integer LEVEL_MAIN  = SCREEN_HEIGHT/2 - round(SCREEN_HEIGHT/10);
Integer LEVEL_SUB   = SCREEN_HEIGHT/2 + round(SCREEN_HEIGHT/10);
Integer LEVEL_SMALL = SCREEN_HEIGHT/2 + round(SCREEN_HEIGHT/3);
Integer TAB_LEFT  = SCREEN_WIDTH/2 - round(SCREEN_WIDTH/6);
Integer TAB_RIGHT = SCREEN_WIDTH/2 + round(SCREEN_WIDTH/6);
color FC_MAIN = color(64, 7, 5);
color FC_SUB = color(128, 128, 128);
color FC_HIDDEN = color(255, 235, 208);

// Store configuration
String PATH_DATA = "/Users/op/dev/digicards/.data/";
String PATH_DIR = PATH_DATA + SCREEN_WIDTH + "x" + SCREEN_HEIGHT + "/"; 

/*
//////////////////////////////////////////////////
*/

void settings() {
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
}


void setup() {
  dictionary = loadTable(DICTIONARY_FILE);
  dictionary_length = dictionary.getRowCount();
  dictionary.removeTokens("\"");
    
}

void draw() {
  background(255);
  
  var line = frameCount - 1;
  
  if (line < dictionary_length) {
    var code = dictionary.getString(line, T_CODE);
    PImage img = null;
    
    // Check if picture exists
    try {
      img = loadImage(code + ".png");
    } catch (Exception e) {
      // 
    }

    // Shift, if picture exists; mix template and logic, nice to be improved
    var shift = 0;
    if (img != null) {
      shift = round(SCREEN_HEIGHT/5);
      draw_picture(img);      
    }
        
    draw_word(line, shift);
    
    saveFrame(PATH_DIR + "#####.jpg");  
    
  }

}

void draw_text(String w, String fname, int fsize, color c, int px, int py) {
    var f = createFont(fname, fsize, true);
    textFont(f);
    fill(c);
    textAlign(CENTER, CENTER);
    text(w, px, py);
}

void draw_word(int line, int shift) {
  
    // Get word
    var word_translate  = dictionary.getString(line, T_TRANSLATE);
    var word_nekudot    = dictionary.getString(line, T_NEKUDOT);
    var word_verb       = dictionary.getString(line, T_VERB);
    // var word_binyan     = dictionary.getString(line, T_BINYAN);
    var word_past3      = dictionary.getString(line, T_PAST3);
    var word_root       = dictionary.getString(line, T_ROOT);

    // Draw all text
    draw_text(word_nekudot,
              FONT_HEBREW, FH_MAIN, FC_HIDDEN, 
              width/2 + shift, LEVEL_MAIN);

    draw_text(word_verb,
              FONT_HEBREW, FH_MAIN, FC_MAIN, 
              width/2 + shift, LEVEL_MAIN);
 
    draw_text(word_past3,
              FONT_HEBREW, FH_SUB, FC_SUB, 
              TAB_LEFT + shift, LEVEL_SUB);
    
    draw_text(word_root,
              FONT_HEBREW, FH_SUB, FC_SUB, 
              TAB_RIGHT + shift, LEVEL_SUB);

    draw_text(text_before_semicolon(word_translate),
              FONT_TRANSLATE, FH_SMALL, FC_HIDDEN, 
              width/2 + shift, LEVEL_SMALL);
              
}

void draw_picture(PImage img) {
  image(img, 0, 0);
  
  color bg = get(5, 5);
  background(bg);
  
  image(img,
        round(SCREEN_HEIGHT/20), height/2 - round(SCREEN_HEIGHT/4),
        SCREEN_HEIGHT/2, SCREEN_HEIGHT/2);
}

String text_before_semicolon(String text) {
  var first_semicolon = text.indexOf(";");
  if (first_semicolon > 0) {
    return text.substring(0, first_semicolon);
  } else {
    return text;
  }
}
