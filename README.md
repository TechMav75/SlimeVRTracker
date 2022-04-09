# SlimeVRTracker

This is for the carrier board for the SlimeVR Tracker at https://docs.slimevr.dev/

The files were designed and exported in Fritzing https://fritzing.org/

There are 3 sets of jumper pads on the back of the board. If you are using an MPU IMU, you will need to solder the left two pads together of the right hand triple pad. It's labled MPU under it. If you're using a BNO IMU, you will need to solder the right two pads of the right hand triple pad, and the both pairs of the other two pads. These are to route the correct signals to the Aux board.


Version Differences: V6 and V7 both work fine, it's a matter of preference on where the power switch is.

v6 Aux Board: These are good. 

v6 Tracker Board: This has the power switch on the side under the charging board

v7 Tacker Board: This has the power switch on the end, under the USB C port. This was moved to allow evrything that you need to access to protrude through the lid of the case. 

Pimoroni Tracker v1 and Pimoroni Tracker Aux v1 are for the Pimoroni PIM448 IMU board, that has the ICM20948 sensor on it.
