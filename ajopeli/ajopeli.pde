
Car racing_car;
boolean horizontal = false;


void setup() {
  size(1000, 800, P2D);
  TTDRGE.init(this);
  TTDRGE.set_track_image(loadImage("your_race_track.png"), 9900);
  racing_car = new Car();
  racing_car.acceleration_speed = 0.3;
  racing_car.turn_speed = 0.03;
  racing_car.r = 255;
  racing_car.g = 0;
  racing_car.b = 0;
}


void draw() {
  rect(0, 0, 100, 100);
  TTDRGE.draw();
  if (horizontal) {
    racing_car.follow_with_camera_horizontal();
  } else {
    racing_car.follow_with_camera();
  }
  racing_car.control('W', 'S', 'A', 'D');
}

void keyPressed() {
  TTDRGE.register_key_press();
  if (key == ' ') horizontal = !horizontal;

  TTDRGE.register_key_press();
  if (key == ' ') horizontal = !horizontal;

  if (TTDRGE.is_key_pressed(SHIFT)){
    racing_car.acceleration_speed = 0.7;
  }
}


public void keyReleased() {
  TTDRGE.register_key_release();
  if (!TTDRGE.is_key_pressed(SHIFT))
    racing_car.acceleration_speed = 0.3;
}
