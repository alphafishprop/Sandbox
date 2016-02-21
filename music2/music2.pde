import themidibus.*;

int channel=0;
int input=0;
int output=1;
MidiBus myBus=new MidiBus(this, input, output);

//                                i    x    ii   iii  x    iv   x    v    vi   x    x    vii  viii
double[][] markov=new double[][]{{.10, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00}};

void setup() {
  size(500, 500);
  background(0);
}