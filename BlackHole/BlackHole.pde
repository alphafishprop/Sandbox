PImage myImage;
public final int MOVE_AMOUNT=1;
public final int HOLE_ROW=height/2;
public final int HOLE_COL=width/2;
void setup(){
  size(800,800);
  myImage=createImage(width,height,ARGB);
}

void draw(){
  background(0);
  
  updateImage(myImage);
  
  myImage.updatePixels();
  
  image (myImage,0,0);
}

void updateImage(PImage image){
  PImage newImage=createImage(width,height,ARGB);
  for(int row=0;row<height;row++){
    for(int col=0;col<width;col++){
      movePixel(image,newImage,row,col);
    }
  }
}

void movePixel(PImage oldImage, PImage newImage, int row, int col){
  int currentIndex=row*width+col;
  color oldColor=oldImage.pixels[currentIndex];
  int oldRed=oldColor>>16&0xff;
  int oldGreen=oldColor>>8&0xff;
  int oldBlue=oldColor>>0&0xff;
  
  
}