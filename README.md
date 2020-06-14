# charis-4-processor
Creation of MIPS based processor named CHARIS. Runs every simple command of the instrucion set of MIPS. 
The datapath in this current repo is implemented two ways:
- Using a single cycle control. For this implementation, no FSM was needed.
- Using a multi cycle control unit. The FSM completes in the worst case scenario a command in 5 cycles.
