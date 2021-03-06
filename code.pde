//initialize variables and colors

int gameState = 0;

color red = color (255,0,0);

color green = color (0,255,0);

int randomNumber = 0;
import processing.video.*;

Capture cam;

int x, y;

//setup the size and background

void setup(){

  size(640, 480);

  background(100);

  

  //chose a random number for the maze we are going to use. Increases for more mazes

  randomNumber = int(random(3));
  size(640, 480);
  frameRate(30);
  background(0);
  //printArray(Capture.list());
  cam = new Capture(this, 640, 480);
  cam.start();
  

  

}


//create the first maze with lots of rectangles.

//We would recommend using this as a base and expanding and changing this maze.

void maze1() {

  

  //print start, still in white from before

  textSize(15);

  text("Start",30,30);

  

  //change color to red for maze walls

  fill(255,0,0);

  stroke(255,0,0);

  


  rect(0,0,640,10);  //========================

  

  rect(0,0,10,530);// first vertical line


  rect(100,0,10,300);
rect(100,400,10,300);


  rect(200,100,10,300);
rect(200,300,110,10);
 
 
 rect(300,0,10,300);

 rect(400,0,10,150);
 rect(400,250,10,300);

rect(500,0,10,400);



  rect(630,0,10,480);
  rect(0,470,640,10);




  

  //create a green box so that you can win. VERY IMPORTANT!

  fill(0,255,0);

  stroke(0,255,0);

  rect(600,400,50,50);


}





//This is a blank maze that you can create, but it has the basic necessities for the maze

// It has to start in upper left

void newMaze() {

  //print start, still in white from before

  textSize(15);

  text("Start",30,30);

  

  //change color to red for maze walls

  fill(255,0,0);

  stroke(255,0,0);

  

  //create a green box so that you can win. VERY IMPORTANT! 

  //You can move this, but it needs to be in the program

  fill(0,255,0);

  stroke(0,255,0);

  rect(200,300,30,50);

}

//draw section-multiple game states so you can move around in the games

void draw() {

  

  //starting screen-made for no cheating

  if (gameState == 0) {
    track();

    background(0);

    fill(255,0,0);

    rect(10,10,30,30);

    fill(255,255,255);

    textSize(20);

    textAlign(CENTER);

    text("Welcome to the Maze",300,250);

    text("Put your mouse in the the red square in the corner to start",350,300);

    

    //once the mouse is in the red you can start the maze

    if (get(mouseX,mouseY) == red) {

      gameState = 1;

    fill(255,255,255);

    ellipse(mouseX,mouseY,10,10);

    }

    

  }

  

  //actual game scene where the ellipse is drawn and the mazes are drawn

  if (gameState == 1) {

    

    //redraw the background so that every ellipse drawn doesn't stay around the whole time

    background(100);

    track();

    //If you want to change what maze is running change

    //this to what the function is called that the maze is in.

    //if you want to only run your maze, comment out all of the 

    //if statements and maze calls, and just put in newMaze();

    

    if (randomNumber == 0) {

      maze1();

    }

    if (randomNumber == 1) {

    maze1();

    }

    if (randomNumber == 2) {

      maze1();

    }

    

    //reset color to white so ellipse can be drawn

    fill(255);

    stroke(255);

  

    // find the pixel the mouse is on, and act accordingly.

    //if it is red, end game, if it is green, win screen

    if (get(x,y) == red) {

      gameState = 2;

      background(0);

    }

    if (get(x,y) == green) {

      gameState = 3;

    }

    

  // print ellipse after so the mouse is not on a white pixel 

    //ellipse(mouseX,mouseY,10,10);

  

  }

 

 // losing screen, and restart

 if(gameState==2){

   fill(255,0,0);

   background(0);

   textSize(30);

   textAlign(CENTER);

   text("Game Over",450,250);

   text("Press R to Restart",450,300);

  }

  

  //winning screen and retry

  if(gameState==3){

   fill(255,0,0);

   background(0);

   textSize(30);

   textAlign(CENTER);

   text("You Win!",450,250);

   text("Press R to Retry",450,300);

  }


}

  

// tells when key is released so no infinite restart looping

void keyReleased(){

 if(key=='r'){

   gameState = 0;

   //chose a random number for the maze we are going to use. Increases for more mazes

   randomNumber = int(random(3));

 }

}

void track()
{
  if(cam.available()) {
    cam.read();
    cam.loadPixels();
    float maxBri = 0;
    int theBrightPixel = 0;
    for(int i=0; i<cam.pixels.length; i++) {
      if(brightness(cam.pixels[i]) > maxBri) {
        maxBri = brightness(cam.pixels[i]);
        theBrightPixel = i;
      }
    }
    x = theBrightPixel % cam.width;
    y = theBrightPixel / cam.width;
  }
  

ellipse(x, y, 20, 20);}

