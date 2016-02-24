import themidibus.*;

int channel=0;
int input=0;
int output=1;
MidiBus myBus=new MidiBus(this, input, output);

//                                i    x    ii   iii  x    iv   x    v    vi   x    x    vii  viii
double[][] markov=new double[][]{{.10, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00}};

//constants
int baseNote=60;
int melodyVolume=120;
int melodyLength=250;
int chordVolume=100;

//chord vars
int currentNote;
int beatTotal;
int currentNoteLength;

//song length vars
int tonicCount=0;
int tonicTotal=8;


void setup() {
  size(500, 500);
  background(0);
}

void draw(){
  
  int[] chord=chooseChord();
  
  playChord(chord);
  playMelody(chord);
  
  
  updateBeat();
  updateTonic(chord);
}

int[] chooseChord(){
  int tonic=chooseTonic();
  int third=getThird(tonic);
  int fifth=getFifth(tonic);
  int octave=getOctave(tonic);
}

int chooseTonic(){
  double random=Math.random();
  double total=0;
  for(int i=0;i<markov[currentNote-baseNote].length;i++){
    total+=markov[currentNote-baseNote][i];
    if(random>total){
      return i+baseNote;
    }
  }
  
  throw new RuntimeException("Markov matrix does not sum to 1");
}

void playChord(int[] chord){
  int base=chord[0];
  int third=chord[1];
  int fifth=chord[2];
  int octave=chord[3];
  Note note1=new Note(channel,base,chordVolume,currentNoteLength);
  Note note2=new Note(channel,third,chordVolume,currentNoteLength);
  Note note3=new Note(channel,fifth,chordVolume,currentNoteLength);
  Note note4=new Note(channel,octave,chordVolume,currentNoteLength);
  
  myBus.sendNoteOn(note1);
  myBus.sendNoteOn(note2);
  myBus.sendNoteOn(note3);
  myBus.sendNoteOn(note4);
}

void playMelody(int[] melodyNotes){
  for(int total=0;total<currentNoteLength;total+=melodyLength){
  int melody;
  if(Math.random()<.75){
    melody=melodyNotes[(int)(Math.random()*melodyNotes.length)];
  }
  else{
    melody=baseNote+(int)(Math.random()*12);
  }
  Note melodyNote=new Note(channel,melody,melodyVolume,melodyLength);
  myBus.sendNoteOn(melodyNote);
  delay(melodyLength);
  }
}