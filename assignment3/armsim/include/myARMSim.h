void run_armsim();
void reset_proc();
void load_program_memory(char* file_name);
void write_data_memory();
void swi_exit();
void parequ(char* s[]);
void partext(char* s[]);
void pardata(char* s[]);

//reads from the instruction memory and updates the instruction register
void fetch();
//reads the instruction register, reads operand1, operand2 fromo register file, decides the operation to be performed in execute stage
void decode();
//executes the ALU operation based on ALUop
void execute();
//perform the memory operation
void mem();
//writes the results back to register file
void write_back();
//to show state after each instruction
void show_state();
int read_word(char *mem, unsigned int address);
void write_word(char *mem, unsigned int address, unsigned int data);

