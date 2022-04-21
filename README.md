# Traffic Light Control System

A Traffic Light Control System , Based On Basys2 Board Using Verilog. Designed For Digital Logic Course Project.

## Introduction
The crossroad traffic lights controls the traffic of `horizontal road`(h-road) and `vertical road`(v-road).

It will run in 6 different modes according to the traffic of each road:

* **Initial state.** Default state, the red / yellow / green lights will signal alternately with 16 sec for red / 3 sec for yellow and 16 sec for green.

* **Busy in both h-road and v-road.** In this state, the system will test another signal called `peak` which means it is the rush hour of the day, making the time of red light 8 sec for horizental road.

* **Busy in h-road, idle in v-road.** In this state, the green light will signal forever for horizental road, the period will be 15 sec. When the count-down finishes, the system will test another signal called `pedestrain` which means there are pedestrains waiting at vertical road to cross, the green light at v-road will signal for one period until the `pedestrain` signal vanishes.

* **Idle in h-road, busy in v-road.** In this state, the system behaves like **Busy in h-road, idle in v-road** but switches the behaviors for h-road and v-road.

* **Idle in both h-road and v-road.** In this state, the system behaves like **Busy in h-road, idle in v-road** but make the signal period of green light at h-road to 16 sec.

* **Manual control.** In this state, all outside signals will be omitted and the auto-system will be down. All traffic light signals will be set directly from control center.

## Module Overview
<p align="center">
  <img alt="Overview" width=70% src="https://raw.githubusercontent.com/yxwangcs/traffic-light-control-system/master/overview.svg?sanitize=true" />  
</p>

## License
[MIT](https://github.com/yuxincs/traffic-light-control-system/blob/master/LICENSE).

