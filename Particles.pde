class Particle extends VerletParticle2D
{
  Particle(float x,float y)
  {
    super(x,y);
  }
  
  void display()
  {
    fill(187);
    ellipse(x,y,5,5);
  }
}
