/**
*An interacitve ice - cream shop 
* The ice cream is a cone , and the flavour changes based on the colour the user presses
*The top displays the base price - $3.00
*And adds up the additional price for toppings , if user chooses
*@version 11 dec 
*/



//CONSTANTS
final int buttonW = 90;
final int buttonH = 40;
final int buttonY = 90; 

PImage cherry;
PImage chocolateImg;
PImage whipcream;
PImage sprinkles;

// flavour button colours 
color butterScotch = #FDB147;
color chocolate = #A55616;
color vanilla = #FAF5F5;
color pistachio = #93C572;
color strawberry = #F088D1;
color scoopColor;

float basePrice = 3.00;
float totalCost = 3.00;

boolean hasChocolate = false;
boolean hasCherry = false;
boolean hasSprinkles = false;
boolean hasWhip = false;

void setup() {
  size(600, 500);
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(20);
  scoopColor=vanilla;
  
 
  cherry = loadImage("cherry.png");
  chocolateImg = loadImage("chocolate.png");
  whipcream = loadImage("whipcream.png");
  sprinkles = loadImage("sprinkles.png");
  
 
}


void draw() {

  background(#5FE098);
 
  
  // title bar displaying cost(at the top)

fill(220);
rect(width/2,25,width,50);

fill(0);
text("Cost: $" + totalCost, width/2, 40);
 


// flavour buttons (attached row)
fill(butterScotch);
rect(140, buttonY, buttonW, buttonH); 
fill(chocolate);
rect(215, buttonY, buttonW, buttonH);

fill(vanilla);
rect(290, buttonY, buttonW, buttonH);

fill(pistachio);
rect(365, buttonY, buttonW, buttonH);

fill(strawberry);
rect(440, buttonY, buttonW, buttonH);

//Actual drawing the images
image(cherry, 120, 400, 95,95);
image(chocolateImg, 240, 400, 95, 95);
image(whipcream, 360, 400, 95, 95);
image(sprinkles, 480, 400, 95, 95);



// CONE
fill(#F5C540);
triangle(width/2 - 30, 235,   // left top
         width/2 + 30, 235,   // right top
         width/2, 380);       // tip down

// SCOOP
fill(scoopColor);
arc(width/2, 235, 90, 90, PI, TWO_PI);

// TOPPINGS

if (hasChocolate) {
  fill(#643C07); // chocolate brown
  noStroke();

  arc(width/2, 210, 100, 90, PI, TWO_PI); 
  ellipse(width/2 - 25, 210, 40, 30); 
  ellipse(width/2, 215, 50, 40);      
  ellipse(width/2 + 25, 210, 40, 30);
}
// Whipped cream – layered ellipses
if (hasWhip) {
  fill(255); // white cream
  noStroke();
  // Bottom layer 
  ellipse(width/2, 185, 65, 25); 
  // Middle layer 
  ellipse(width/2, 170, 50, 20); 
  ellipse(width/2, 155, 30, 15); 
}

// Cherry – always sits on the top 
if (hasCherry) {

  float cherryY;

  if (hasWhip) {
    // Cherry on whipped cream
    cherryY = 135;
  } 
  else if (hasChocolate) {
    // Cherry on chocolate cream
    cherryY = 165;
  } 
  else {
    // Cherry on plain scoop
    cherryY = 180;
  }

  fill(255, 0, 0);
  stroke(150, 0, 0);
  strokeWeight(2);
  ellipse(width/2, cherryY, 25, 25);
}  


// Sprinkles – scattered small rectangles
if (hasSprinkles) {
  fill(#EA9CF5); 
  rect(width/2 - 15, 220, 5, 10);
  fill(#A1DFF5); 
  rect(width/2 + 10, 210, 5, 10);
  fill(#F2E790); 
  rect(width/2, 215, 5, 10);
  fill(#90F2B8); 
  rect(width/2 - 5, 205, 5, 10);
  fill( #F2D390);  
  rect(width/2 + 15, 205, 5, 10);
}

}

void mousePressed(){
  
  
  // ButterScotch
  if (mouseX > 140 - buttonW/2 && mouseX < 140 + buttonW/2 &&
      mouseY > buttonY - buttonH/2 && mouseY < buttonY + buttonH/2) {
    scoopColor = butterScotch;
    updateCost();
  }

  // Chocolate
  if (mouseX > 215 - buttonW/2 && mouseX < 215 + buttonW/2 &&
      mouseY > buttonY - buttonH/2 && mouseY < buttonY + buttonH/2) {
    scoopColor = chocolate;
    updateCost();
  }

  // Vanilla
  if (mouseX > 290 - buttonW/2 && mouseX < 290 + buttonW/2 &&
      mouseY > buttonY - buttonH/2 && mouseY < buttonY + buttonH/2) {
    scoopColor = vanilla;
    updateCost();
  }

  // Pistachio
  if (mouseX > 365 - buttonW/2 && mouseX < 365 + buttonW/2 &&
      mouseY > buttonY - buttonH/2 && mouseY < buttonY + buttonH/2) {
    scoopColor = pistachio;
    updateCost();
  }

  // Strawberry
  if (mouseX > 440 - buttonW/2 && mouseX < 440 + buttonW/2 &&
      mouseY > buttonY - buttonH/2 && mouseY < buttonY + buttonH/2) {
    scoopColor = strawberry;
    updateCost();
  }
  
 
  //  TOPPING BUTTONS
  // Chocolate topping
  if (mouseX > 240 - 48 && mouseX < 240 + 48 &&
      mouseY > 400 - 48 && mouseY < 400 + 48) {
    if (hasChocolate == false) {
      hasChocolate = true;
      totalCost = totalCost + 1.0;
    } else {
      hasChocolate = false;
      totalCost= totalCost - 1.0; //{changes the cost to base price}
    }
  }

  // Cherry topping
  if (mouseX > 120 - 48 && mouseX < 120 + 48 &&
      mouseY > 400 - 48 && mouseY < 400 + 48) {
    if (hasCherry == false) {
      hasCherry = true;
      totalCost= totalCost+1.0;
    } else {
      hasCherry = false;
      totalCost = totalCost-1.0;
    }
  }

  // Whipped cream topping
  if (mouseX > 360 - 48 && mouseX < 360 + 48 &&
      mouseY > 400 - 48 && mouseY < 400 + 48) {
    if (hasWhip == false) {
      hasWhip = true;
      totalCost = totalCost + 1.75;
    } else {
      hasWhip = false;
     totalCost = totalCost - 1.75;
    }
  }

  // Sprinkles topping
  if (mouseX > 480 - 48 && mouseX < 480 + 48 &&
      mouseY > 400 - 48 && mouseY < 400 + 48) {
    if (hasSprinkles == false) {
      hasSprinkles = true;
     totalCost = totalCost + 1.75;
    } else {
      hasSprinkles = false;
      totalCost = totalCost - 1.75;
    }
  }

}





void updateCost() {
  totalCost = basePrice;

  if (hasChocolate) totalCost = totalCost + 1.0;
  if (hasCherry) totalCost = totalCost + 1.0;
  if (hasWhip) totalCost = totalCost + 1.75;
  if (hasSprinkles) totalCost = totalCost + 1.75;
}
