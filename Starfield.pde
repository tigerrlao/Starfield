Particle[] bob;
void setup()
{
	size(500,500);
	background(0);
	bob = new Particle[500];
	for(int i = 0; i < bob.length; i++)
	{
		bob[i] = new NormalParticle();
		if((i%100)==0)
		{
			bob[i] = new JumboParticle();
		}
	}
	bob[2] = new OddballParticle();
}
void draw()
{
	noStroke();
	fill(0,0,0,10);
	rect(0,0,500,500);

	for(int i = 0; i <bob.length; i++)
	{
		bob[i].move();
		bob[i].show();
	}
}
class NormalParticle implements Particle
{
	double x,y,angle,speed;
	int randColourR,randColourG,randColourB;
	NormalParticle()
	{
		x = 250;
		y = 250;
		angle = Math.random()*2*Math.PI;
		speed = 2;
		randColourR = (int)(Math.random()*255);
		randColourG = (int)(Math.random()*255);
		randColourB = (int)(Math.random()*255);
	}
	void move()
	{
		x = x + (Math.cos(angle)*speed);
		y = y + (Math.sin(angle)*speed);
		if((x > 500) || (x < 0) || (y > 500) || (y < 0))
		{
			x = 250;
			y = 250;
		}
	}
	void show()
	{
		noStroke();
		fill(randColourR,randColourG,randColourB);
		ellipse((float)x,(float)y,5,5);
	}
}
interface Particle
{
	public void move();
	public void show();
}
class OddballParticle implements Particle
{
	double x,y;
	int randColourR,randColourG,randColourB;
	OddballParticle()
	{
		x = 250;
		y = 250;
		randColourR = (int)(Math.random()*255);
		randColourG = (int)(Math.random()*255);
		randColourB = (int)(Math.random()*255);
	}
	public void move()
	{
		x = x + ((Math.random()*10)-5);
		y = y + ((Math.random()*10)-5);
	}
	public void show()
	{
		fill(randColourR,randColourG,randColourB);
		ellipse((float)x,(float)y,15,15);
	}
}
class JumboParticle extends NormalParticle
{
	public void show()
	{
		ellipse((float)x,(float)y,30,30);
	}
}

