int pixelCount, pixelJump, uniformLastY, stepFactor;
float perlinLastY, perlinTime, perlinTimeIncrement;

void setup(){
  size(1200, 1000);
  background(255);
  pixelJump = 2;
  uniformLastY = height / 4;
  perlinLastY = (int) (height * 0.75);
  perlinTimeIncrement = 0.05f;
  
  //Divider
  strokeWeight(2);
  line(0, height / 2, width, height / 2);
}

void draw(){
  
  if(pixelCount < width){
  
    //Uniform random
    int y = (int) random(height / 2);
    
    //Perlin noise random
    float perlinY = map(noise(perlinTime), 0, 1, 0, height / 2) + height / 2;
  
    //Render the lines
    strokeWeight(2);
    //Uniform
    line(pixelCount - pixelJump, uniformLastY, pixelCount, y);
    
    //Perlin noise
    line(pixelCount - pixelJump, perlinLastY, pixelCount, perlinY);
  
    //Store values for next iteration
    uniformLastY = y;
    perlinLastY = perlinY;
    
    //Make increments
    pixelCount += pixelJump;
    perlinTime += 0.01;
    
  }
  
}