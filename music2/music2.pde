import themidibus.*;

int channel=0;
int input=0;
int output=1;
MidiBus myBus=new MidiBus(this, input, output);

//                                i    x    ii   iii  x    iv   x    v    vi   x    x    vii  viii
double[][] markov=new double[][]{{.10, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00}};

int baseNote;
int currentNote;
int beatTotal;
int currentNoteLength;

int tonicCount=0;
int tonicTotal=8;

int chordVolume=100;

int melodyVolume=120;
int melodyLength=250;

void setup() {
  size(500, 500);
  background(0);
}

void draw(){
  
  int[] chord=chooseChord();
  
  playChord(chord);
  
  int melody=choseMelody(chord);
  
  playMelody(melody);
  
  
  updateBeat();
  updateTonic(chord);
}

int[] chooseChord(){
  int tonic=choseTonic();
  int third=getThird(tonic);
  int fifth=getFifth(tonic);
  int octave=getOctave(tonic);
}

void playChord(int[] chord){
  int base=chord[0];
  int third=chord[1];
  int fifth=chord[2];
  int octave=chord[3];
  Note note1=new Note(channel,base,chordVolume,noteLength);
  Note note2=new Note(channel,third,chordVolume,noteLength);
  Note note3=new Note(channel,fifth,chordVolume,noteLength);
  Note note4=new Note(channel,fifth,chordVolume,noteLength);
  
  myBus.sendNoteOn(note1);
  myBus.sendNoteOn(note2);
  myBus.sendNoteOn(note3);
  myBus.sendNoteOn(note4);
}

void playMelody(int melody){
  
}