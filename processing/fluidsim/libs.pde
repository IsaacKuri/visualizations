int IX(int x_, int y_){
  x_ = constrain(x_, 0, N -1);
  y_ = constrain(y_, 0, N -1);
  return x_ + y_ * N;
}
