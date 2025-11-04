module colorpart(clr) {
  color(colors[clr])
  if (clr==current_color || current_color==-1) {
    children();
  }
  else {
  }
}