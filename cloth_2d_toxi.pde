import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;
import toxi.geom.*;

int cols=40;
int rows=40;


Particle[][] particles=new Particle[cols][rows];
ArrayList<Spring> springs;

VerletPhysics2D physics;

float w=10;
//float x=50;
//float y=20;
  
void setup()
{
  size(600,600);
    
  springs=new ArrayList<Spring>(); 
  physics=new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0,0.5)));
  
  
  float x=100;
  for(int i=0;i<cols;i++)
  {
    float y=10;
    for(int j=0;j<rows;j++)
    {
    Particle p=new Particle(x,y);
    particles[i][j]=p;
    physics.addParticle(p);
    y=y+w;
    }
    x=x+w;
  }
  
   for(int i=0;i<cols-1;i++)
  {
    for(int j=0;j<rows-1;j++)
    {
      Particle a=particles[i][j];
      Particle b1=particles[i+1][j];      
      Particle b2=particles[i][j+1];
      Spring s1=new Spring(a,b1);
      springs.add(s1);
      physics.addSpring(s1);
      Spring s2=new Spring(a,b2);
      springs.add(s2);
      physics.addSpring(s2);
    }
  }
 
  particles[0][0].lock();
  particles[cols-1][0].lock();
  
  
}

void draw()
{
  background(0);
  smooth();
  physics.update();
  for(int i=0;i<cols;i++)
  {
    for(int j=0;j<rows;j++)
    {
      //particles[i][j].display();
    }
  }
  
   for(Spring s : springs)
  {
    s.display();
  }

}
