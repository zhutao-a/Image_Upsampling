
`timescale 1 ns / 1 ps

	module axi_ddr_rw_v1_0_M_AXI #
	(
		// Users to add parameters here

		// User parameters ends
			
		// Do not modify the parameters beyond this line

		// Base address of targeted slave
		parameter  C_M_TARGET_SLAVE_BASE_ADDR_READ	= 32'h10000000,
		parameter  C_M_TARGET_SLAVE_BASE_ADDR_WRITE	= 32'h16000000,
		// Burst Length. Supports 1, 2, 4, 8, 16, 32, 64, 128, 256 burst lengths
		parameter integer C_M_AXI_BURST_LEN_READ	= 8,
		parameter integer C_M_AXI_BURST_LEN_WRITE	= 16,
		// Thread ID Width
		parameter integer C_M_AXI_ID_WIDTH	= 1,
		// Width of Address Bus
		parameter integer C_M_AXI_ADDR_WIDTH	= 32,
		// Width of Data Bus
		parameter integer C_M_AXI_DATA_WIDTH	= 32,
		// Width of User Write Address Bus
		parameter integer C_M_AXI_AWUSER_WIDTH	= 0,
		// Width of User Read Address Bus
		parameter integer C_M_AXI_ARUSER_WIDTH	= 0,
		// Width of User Write Data Bus
		parameter integer C_M_AXI_WUSER_WIDTH	= 0,
		// Width of User Read Data Bus
		parameter integer C_M_AXI_RUSER_WIDTH	= 0,
		// Width of User Response Bus
		parameter integer C_M_AXI_BUSER_WIDTH	= 0
	)
	(
		// Users to add ports here
		input wire [16*24-1:0] IMG_4K_DATA,
		input wire send_flag,
		
        output wire [5*24-1:0] IMG_1K_DATA,
        output wire receive_flag,
        
        output wire [9:0] row_index,
        output wire [9:0] col_index,
        
        //debug ports with ILA
//        output wire READ_FF,
//        output wire [8*32-1:0] READ_DATA,
//        output wire read_detect,
//        output wire write_detect,
//        output wire [16*24-1:0] WRITE_DATA,
//        output wire [31:0] image_idx,
		// User ports ends
		// Do not modify the ports beyond this line

		// Initiate AXI transactions
		input wire  INIT_AXI_TXN,
		// Asserts when transaction is complete
		output wire  TXN_DONE,
		// Asserts when ERROR is detected
		output reg  ERROR,
		// Global Clock Signal.
		input wire  M_AXI_ACLK,
		// Global Reset Singal. This Signal is Active Low
		input wire  M_AXI_ARESETN,
		// Master Interface Write Address ID
		output wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_AWID,
		// Master Interface Write Address
		output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_AWADDR,
		// Burst length. The burst length gives the exact number of transfers in a burst
		output wire [7 : 0] M_AXI_AWLEN,
		// Burst size. This signal indicates the size of each transfer in the burst
		output wire [2 : 0] M_AXI_AWSIZE,
		// Burst type. The burst type and the size information, 
    // determine how the address for each transfer within the burst is calculated.
		output wire [1 : 0] M_AXI_AWBURST,
		// Lock type. Provides additional information about the
    // atomic characteristics of the transfer.
		output wire  M_AXI_AWLOCK,
		// Memory type. This signal indicates how transactions
    // are required to progress through a system.
		output wire [3 : 0] M_AXI_AWCACHE,
		// Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
		output wire [2 : 0] M_AXI_AWPROT,
		// Quality of Service, QoS identifier sent for each write transaction.
		output wire [3 : 0] M_AXI_AWQOS,
		// Optional User-defined signal in the write address channel.
		output wire [C_M_AXI_AWUSER_WIDTH-1 : 0] M_AXI_AWUSER,
		// Write address valid. This signal indicates that
    // the channel is signaling valid write address and control information.
		output wire  M_AXI_AWVALID,
		// Write address ready. This signal indicates that
    // the slave is ready to accept an address and associated control signals
		input wire  M_AXI_AWREADY,
		// Master Interface Write Data.
		output wire [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_WDATA,
		// Write strobes. This signal indicates which byte
    // lanes hold valid data. There is one write strobe
    // bit for each eight bits of the write data bus.
		output wire [C_M_AXI_DATA_WIDTH/8-1 : 0] M_AXI_WSTRB,
		// Write last. This signal indicates the last transfer in a write burst.
		output wire  M_AXI_WLAST,
		// Optional User-defined signal in the write data channel.
		output wire [C_M_AXI_WUSER_WIDTH-1 : 0] M_AXI_WUSER,
		// Write valid. This signal indicates that valid write
    // data and strobes are available
		output wire  M_AXI_WVALID,
		// Write ready. This signal indicates that the slave
    // can accept the write data.
		input wire  M_AXI_WREADY,
		// Master Interface Write Response.
		input wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_BID,
		// Write response. This signal indicates the status of the write transaction.
		input wire [1 : 0] M_AXI_BRESP,
		// Optional User-defined signal in the write response channel
		input wire [C_M_AXI_BUSER_WIDTH-1 : 0] M_AXI_BUSER,
		// Write response valid. This signal indicates that the
    // channel is signaling a valid write response.
		input wire  M_AXI_BVALID,
		// Response ready. This signal indicates that the master
    // can accept a write response.
		output wire  M_AXI_BREADY,
		// Master Interface Read Address.
		output wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_ARID,
		// Read address. This signal indicates the initial
    // address of a read burst transaction.
		output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_ARADDR,
		// Burst length. The burst length gives the exact number of transfers in a burst
		output wire [7 : 0] M_AXI_ARLEN,
		// Burst size. This signal indicates the size of each transfer in the burst
		output wire [2 : 0] M_AXI_ARSIZE,
		// Burst type. The burst type and the size information, 
    // determine how the address for each transfer within the burst is calculated.
		output wire [1 : 0] M_AXI_ARBURST,
		// Lock type. Provides additional information about the
    // atomic characteristics of the transfer.
		output wire  M_AXI_ARLOCK,
		// Memory type. This signal indicates how transactions
    // are required to progress through a system.
		output wire [3 : 0] M_AXI_ARCACHE,
		// Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
		output wire [2 : 0] M_AXI_ARPROT,
		// Quality of Service, QoS identifier sent for each read transaction
		output wire [3 : 0] M_AXI_ARQOS,
		// Optional User-defined signal in the read address channel.
		output wire [C_M_AXI_ARUSER_WIDTH-1 : 0] M_AXI_ARUSER,
		// Write address valid. This signal indicates that
    // the channel is signaling valid read address and control information
		output wire  M_AXI_ARVALID,
		// Read address ready. This signal indicates that
    // the slave is ready to accept an address and associated control signals
		input wire  M_AXI_ARREADY,
		// Read ID tag. This signal is the identification tag
    // for the read data group of signals generated by the slave.
		input wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_RID,
		// Master Read Data
		input wire [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_RDATA,
		// Read response. This signal indicates the status of the read transfer
		input wire [1 : 0] M_AXI_RRESP,
		// Read last. This signal indicates the last transfer in a read burst
		input wire  M_AXI_RLAST,
		// Optional User-defined signal in the read address channel.
		input wire [C_M_AXI_RUSER_WIDTH-1 : 0] M_AXI_RUSER,
		// Read valid. This signal indicates that the channel
    // is signaling the required read data.
		input wire  M_AXI_RVALID,
		// Read ready. This signal indicates that the master can
    // accept the read data and response information.
		output wire  M_AXI_RREADY
	);


	// function called clogb2 that returns an integer which has the
	//value of the ceiling of the log base 2

	  // function called clogb2 that returns an integer which has the 
	  // value of the ceiling of the log base 2.                      
	  function integer clogb2 (input integer bit_depth);              
	  begin                                                           
	    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)                   
	      bit_depth = bit_depth >> 1;                                 
	    end                                                           
	  endfunction                                                     

     localparam integer READ_DETECTION_ADDR = 32'h14000000;
     localparam integer WRITE_DETECTION_ADDR = 32'h1A000000;
	// C_TRANSACTIONS_NUM is the width of the index counter for 
	// number of write or read transaction.
	 localparam integer C_TRANSACTIONS_NUM_READ = clogb2(C_M_AXI_BURST_LEN_READ-1);
	 localparam integer C_TRANSACTIONS_NUM_WRITE = clogb2(C_M_AXI_BURST_LEN_WRITE-1);
	 
	// Burst length for transactions, in C_M_AXI_DATA_WIDTHs.
	// Non-2^n lengths will eventually cause bursts across 4K address boundaries.
	 //localparam integer C_MASTER_LENGTH	= 12;
	 
	 localparam integer BMP_HEIGHT = 540;
	 localparam integer BMP_WIDTH = 960;
	// total number of burst transfers is 964*540
//	 localparam integer C_NO_BURSTS_REQ_READ = clogb2((BMP_WIDTH+4)*BMP_HEIGHT);
//	 localparam integer C_NO_BURSTS_REQ_WRITE = clogb2(BMP_WIDTH*BMP_HEIGHT);
	// Example State machine to initialize counter, initialize write transactions, 
	// initialize read transactions and comparison of read data with the 
	// written data words.
	 localparam [1:0] IDLE = 2'b00, // This state initiates AXI4Lite transaction 
			// after the state machine changes state to INIT_WRITE 
			// when there is 0 to 1 transition on INIT_AXI_TXN
		READ_OPERATION = 2'b01, // This state initializes read transaction
			// once reads are done, the state machine 
			// changes state to INIT_WRITE 
        WRITE_OPERATION   = 2'b10, // This state initializes write transaction,
			// once writes are done, the state machine 
			// changes state to INIT_DISPLAY 
		DONE = 2'b11; // This state issues the status of display 
			// of the written data which is 4K BMP image

	 reg [1:0] mst_exec_state;

	// AXI4LITE signals
	//AXI4 internal temp signals
	reg [C_M_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awvalid;
	reg [C_M_AXI_DATA_WIDTH-1 : 0] 	axi_wdata;
	reg  	axi_wlast;
	reg  	axi_wvalid;
	reg  	axi_bready;
	reg [C_M_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arvalid;
	reg  	axi_rready;
	//write beat count in a burst
	reg [C_TRANSACTIONS_NUM_WRITE : 0] 	write_index;
	//read beat count in a burst
	reg [C_TRANSACTIONS_NUM_READ : 0] 	read_index;
	//size of C_M_AXI_BURST_LEN length burst in bytes
	wire [C_TRANSACTIONS_NUM_READ+2 : 0] 	burst_size_bytes_read;
	wire [C_TRANSACTIONS_NUM_WRITE+2 : 0] 	burst_size_bytes_write;
	//The burst counters are used to track the number of burst transfers of C_M_AXI_BURST_LEN burst length needed to transfer 2^C_MASTER_LENGTH bytes of data.
//	reg [C_NO_BURSTS_REQ_WRITE : 0] 	write_burst_counter;
//	reg [C_NO_BURSTS_REQ_READ : 0] 	read_burst_counter;
	reg  	start_single_burst_write;
	reg  	start_single_burst_read;
//	reg  	writes_done;
//	reg  	reads_done;
    reg     interpolation_done;
	reg  	error_reg;
	reg  	burst_write_active;
	reg  	burst_read_active;
	//Interface response error flags
	wire  	write_resp_error;
	wire  	read_resp_error;
	wire  	wnext;
	wire  	rnext;
	reg  	init_txn_ff;
	reg  	init_txn_ff2;
	reg  	init_txn_edge;
	wire  	init_txn_pulse;
	
	wire [5*24-1 : 0] img_1k_data;
    reg [16*24-1:0]  img_4k_data;
	reg five_flag;
	reg read_finish_flag;
	reg write_finish_flag;
	reg [9:0] col_num;
	reg [9:0] row_num;
	reg [31:0] image_num;
    reg send_start_flag;
    reg read_detection_flag;
    reg write_detection_flag;
    reg [8*32-1:0] read_data;
    wire [8*32-1:0] expected_read_data;
    wire [16*32-1:0] expected_write_data;
    reg all_done;

	// I/O Connections assignments
    assign IMG_1K_DATA = img_1k_data;
    assign receive_flag = five_flag;
    assign col_index = col_num;
    assign row_index = row_num;
    
//    assign READ_DATA = read_data;
//    assign READ_FF = read_finish_flag;
//    assign read_detect = read_detection_flag;
//    assign write_detect = write_detection_flag;
//    assign WRITE_DATA = img_4k_data;
//    assign image_idx = image_num;
    
	//I/O Connections. Write Address (AW)
	assign M_AXI_AWID	= 'b0;
	//The AXI address is a concatenation of the target base address + active offset range
	assign M_AXI_AWADDR	= (write_detection_flag == 1'b0) ? C_M_TARGET_SLAVE_BASE_ADDR_WRITE + axi_awaddr : WRITE_DETECTION_ADDR;
	//Burst LENgth is number of transaction beats, minus 1
	assign M_AXI_AWLEN	= C_M_AXI_BURST_LEN_WRITE - 1;
	//Size should be C_M_AXI_DATA_WIDTH, in 2^SIZE bytes, otherwise narrow bursts are used
	assign M_AXI_AWSIZE	= clogb2((C_M_AXI_DATA_WIDTH/8)-1);
	//INCR burst type is usually used, except for keyhole bursts
	assign M_AXI_AWBURST	= 2'b01;
	assign M_AXI_AWLOCK	= 1'b0;
	//Update value to 4'b0011 if coherent accesses to be used via the Zynq ACP port. Not Allocated, Modifiable, not Bufferable. Not Bufferable since this example is meant to test memory, not intermediate cache. 
	assign M_AXI_AWCACHE	= 4'b0010;
	assign M_AXI_AWPROT	= 3'h0;
	assign M_AXI_AWQOS	= 4'h0;
	assign M_AXI_AWUSER	= 'b1;
	assign M_AXI_AWVALID	= axi_awvalid;
	//Write Data(W)
	assign M_AXI_WDATA	= axi_wdata;
	//All bursts are complete and aligned in this example
	assign M_AXI_WSTRB	= {(C_M_AXI_DATA_WIDTH/8){1'b1}};
	assign M_AXI_WLAST	= axi_wlast;
	assign M_AXI_WUSER	= 'b0;
	assign M_AXI_WVALID	= axi_wvalid;
	//Write Response (B)
	assign M_AXI_BREADY	= axi_bready;
	//Read Address (AR)
	assign M_AXI_ARID	= 'b0;
	assign M_AXI_ARADDR	= (read_detection_flag == 1'b1) ? C_M_TARGET_SLAVE_BASE_ADDR_READ + axi_araddr : READ_DETECTION_ADDR;
	//Burst LENgth is number of transaction beats, minus 1
	assign M_AXI_ARLEN	= C_M_AXI_BURST_LEN_READ - 1;
	//Size should be C_M_AXI_DATA_WIDTH, in 2^n bytes, otherwise narrow bursts are used
	assign M_AXI_ARSIZE	= clogb2((C_M_AXI_DATA_WIDTH/8)-1);
	//INCR burst type is usually used, except for keyhole bursts
	assign M_AXI_ARBURST	= 2'b01;
	assign M_AXI_ARLOCK	= 1'b0;
	//Update value to 4'b0011 if coherent accesses to be used via the Zynq ACP port. Not Allocated, Modifiable, not Bufferable. Not Bufferable since this example is meant to test memory, not intermediate cache. 
	assign M_AXI_ARCACHE	= 4'b0010;
	assign M_AXI_ARPROT	= 3'h0;
	assign M_AXI_ARQOS	= 4'h0;
	assign M_AXI_ARUSER	= 'b1;
	assign M_AXI_ARVALID	= axi_arvalid;
	//Read and Read Response (R)
	assign M_AXI_RREADY	= axi_rready;
	//Example design I/O
	assign TXN_DONE	= all_done;
	//Burst size in bytes
	assign burst_size_bytes_read = C_M_AXI_BURST_LEN_READ * C_M_AXI_DATA_WIDTH/8;
	assign burst_size_bytes_write = C_M_AXI_BURST_LEN_WRITE * C_M_AXI_DATA_WIDTH/8;
	assign init_txn_pulse	= (!init_txn_ff2) && init_txn_ff;
    
    assign img_1k_data = {read_data[7*32+:24],read_data[6*32+:24],read_data[5*32+:24],read_data[4*32+:24],read_data[3*32+:24]};
    assign expected_read_data = {image_num[31:0],{7*4{8'b11111111}}};
    assign expected_write_data = {image_num[23:0],{15*3{8'b11111111}}};
	//Generate a pulse to initiate AXI transaction.
	always @(posedge M_AXI_ACLK)										      
	  begin                                                                        
	    // Initiates AXI transaction delay    
	    if (M_AXI_ARESETN == 0 )                                                   
	      begin                                                                    
	        init_txn_ff <= 1'b0;                                                   
	        init_txn_ff2 <= 1'b0;                                                   
	      end                                                                               
	    else                                                                       
	      begin  
	        init_txn_ff <= INIT_AXI_TXN;
	        init_txn_ff2 <= init_txn_ff;                                                                 
	      end                                                                      
	  end     


	//--------------------
	//Write Address Channel
	//--------------------

	// The purpose of the write address channel is to request the address and 
	// command information for the entire transaction.  It is a single beat
	// of information.

	// The AXI4 Write address channel in this example will continue to initiate
	// write commands as fast as it is allowed by the slave/interconnect.
	// The address will be incremented on each accepted address transaction,
	// by burst_size_byte to point to the next address. 

	  always @(posedge M_AXI_ACLK)                                   
	  begin                                                                
	                                                                       
	    if (M_AXI_ARESETN == 0  || init_txn_pulse == 1'b1)                                           
	      begin                                                            
	        axi_awvalid <= 1'b0;                                           
	      end                                                              
	    // If previously not valid , start next transaction                
	    else if (~axi_awvalid && start_single_burst_write)                 
	      begin                                                            
	        axi_awvalid <= 1'b1;                                           
	      end                                                              
	    /* Once asserted, VALIDs cannot be deasserted, so axi_awvalid      
	    must wait until transaction is accepted */                         
	    else if (M_AXI_AWREADY && axi_awvalid)                             
	      begin                                                            
	        axi_awvalid <= 1'b0;                                           
	      end                                                              
	    else                                                               
	      axi_awvalid <= axi_awvalid;                                      
	    end                                                                
	                                                                       
	                                                                       
	// Next address after AWREADY indicates previous address acceptance    
	  always @(posedge M_AXI_ACLK)                                         
	  begin                                                                
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 || interpolation_done == 1'b1)                                            
	      begin                                                            
	        axi_awaddr <= 'b0;                                             
	      end
	    else if (M_AXI_AWREADY && axi_awvalid && col_num >= 4 && write_detection_flag == 1'b0)                            
	      begin                                                            
	        axi_awaddr <= axi_awaddr + burst_size_bytes_write;                   
	      end                                                              
	    else                                                               
	      axi_awaddr <= axi_awaddr;                                        
	    end                                                                


	//--------------------
	//Write Data Channel
	//--------------------

	//The write data will continually try to push write data across the interface.

	//The amount of data accepted will depend on the AXI slave and the AXI
	//Interconnect settings, such as if there are FIFOs enabled in interconnect.

	//Note that there is no explicit timing relationship to the write address channel.
	//The write channel has its own throttling flag, separate from the AW channel.

	//Synchronization between the channels must be determined by the user.

	//The simpliest but lowest performance would be to only issue one address write
	//and write data burst at a time.

	//In this example they are kept in sync by using the same address increment
	//and burst sizes. Then the AW and W channels have their transactions measured
	//with threshold counters as part of the user logic, to make sure neither 
	//channel gets too far ahead of each other.

	//Forward movement occurs when the write channel is valid and ready

	  assign wnext = M_AXI_WREADY & axi_wvalid;                                   
	                                                                                    
	// WVALID logic, similar to the axi_awvalid always block above                      
	  always @(posedge M_AXI_ACLK)                                                      
	  begin                                                                             
	    if (M_AXI_ARESETN == 0  || init_txn_pulse == 1'b1)                                                        
	      begin                                                                         
	        axi_wvalid <= 1'b0;                                                         
	      end                                                                           
	    // If previously not valid, start next transaction                              
	    else if (~axi_wvalid && start_single_burst_write)                               
	      begin                                                                         
	        axi_wvalid <= 1'b1;                                                         
	      end                                                                           
	    /* If WREADY and too many writes, throttle WVALID                               
	    Once asserted, VALIDs cannot be deasserted, so WVALID                           
	    must wait until burst is complete with WLAST */                                 
	    else if (wnext && axi_wlast)                                                    
	      axi_wvalid <= 1'b0;                                                           
	    else                                                                            
	      axi_wvalid <= axi_wvalid;                                                     
	  end                                                                               
	                                                                                    
	                                                                                    
	//WLAST generation on the MSB of a counter underflow                                
	// WVALID logic, similar to the axi_awvalid always block above                      
	  always @(posedge M_AXI_ACLK)                                                      
	  begin                                                                             
	    if (M_AXI_ARESETN == 0  || init_txn_pulse == 1'b1)                                                        
	      begin                                                                         
	        axi_wlast <= 1'b0;                                                          
	      end                                                                           
	    // axi_wlast is asserted when the write index                                   
	    // count reaches the penultimate count to synchronize                           
	    // with the last write data when write_index is b1111                           
	    // else if (&(write_index[C_TRANSACTIONS_NUM-1:1])&& ~write_index[0] && wnext)  
	    else if (((write_index == C_M_AXI_BURST_LEN_WRITE-2 && C_M_AXI_BURST_LEN_WRITE >= 2) && wnext) || (C_M_AXI_BURST_LEN_WRITE == 1 ))
	      begin                                                                         
	        axi_wlast <= 1'b1;                                                          
	      end                                                                           
	    // Deassrt axi_wlast when the last write data has been                          
	    // accepted by the slave with a valid response                                  
	    else if (wnext)                                                                 
	      axi_wlast <= 1'b0;                                                            
	    else if (axi_wlast && C_M_AXI_BURST_LEN_WRITE == 1)                                   
	      axi_wlast <= 1'b0;                                                            
	    else                                                                            
	      axi_wlast <= axi_wlast;                                                       
	  end                                                                               
	                                                                                    
	                                                                                    
	/* Burst length counter. Uses extra counter register bit to indicate terminal       
	 count to reduce decode logic */                                                    
	  always @(posedge M_AXI_ACLK)                                                      
	  begin                                                                             
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 || start_single_burst_write == 1'b1)    
	      begin                                                                         
	        write_index <= 0;                                                           
	      end                                                                           
	    else if (wnext && (write_index != C_M_AXI_BURST_LEN_WRITE-1))                         
	      begin                                                                         
	        write_index <= write_index + 1;                                             
	      end                                                                           
	    else                                                                            
	      write_index <= write_index;                                                   
	  end                                                                                                                                                  


	//----------------------------
	//Write Response (B) Channel
	//----------------------------

	//The write response channel provides feedback that the write has committed
	//to memory. BREADY will occur when all of the data and the write address
	//has arrived and been accepted by the slave.

	//The write issuance (number of outstanding write addresses) is started by 
	//the Address Write transfer, and is completed by a BREADY/BRESP.

	//While negating BREADY will eventually throttle the AWREADY signal, 
	//it is best not to throttle the whole data channel this way.

	//The BRESP bit [1] is used indicate any errors from the interconnect or
	//slave for the entire write burst. This example will capture the error 
	//into the ERROR output. 

	  always @(posedge M_AXI_ACLK)                                     
	  begin                                                                 
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                                            
	      begin                                                             
	        axi_bready <= 1'b0;                                             
	      end                                                               
	    // accept/acknowledge bresp with axi_bready by the master           
	    // when M_AXI_BVALID is asserted by slave                           
	    else if (M_AXI_BVALID && ~axi_bready)                               
	      begin                                                             
	        axi_bready <= 1'b1;                                             
	      end                                                               
	    // deassert after one clock cycle                                   
	    else if (axi_bready)                                                
	      begin                                                             
	        axi_bready <= 1'b0;                                             
	      end                                                               
	    // retain the previous value                                        
	    else                                                                
	      axi_bready <= axi_bready;                                         
	  end                                                                   
	                                                                        
	                                                                        
	//Flag any write response errors                                        
	  assign write_resp_error = axi_bready & M_AXI_BVALID & M_AXI_BRESP[1]; 


	//----------------------------
	//Read Address Channel
	//----------------------------

	//The Read Address Channel (AW) provides a similar function to the
	//Write Address channel- to provide the tranfer qualifiers for the burst.

	//In this example, the read address increments in the same
	//manner as the write address channel.

	  always @(posedge M_AXI_ACLK)                                 
	  begin                                                              
	                                                                     
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                                         
	      begin                                                          
	        axi_arvalid <= 1'b0;                                         
	      end                                                            
	    // If previously not valid , start next transaction              
	    else if (~axi_arvalid && start_single_burst_read)                
	      begin                                                          
	        axi_arvalid <= 1'b1;                                         
	      end                                                            
	    else if (M_AXI_ARREADY && axi_arvalid)                           
	      begin                                                          
	        axi_arvalid <= 1'b0;                                         
	      end                                                            
	    else                                                             
	      axi_arvalid <= axi_arvalid;                                    
	  end                                                                
	                                                                     
	                                                                     
	// Next address after ARREADY indicates previous address acceptance  
	  always @(posedge M_AXI_ACLK)                                       
	  begin                                                              
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 || interpolation_done == 1'b1)                                          
	      begin                                                          
	        axi_araddr <= 'b0;                                           
	      end
        else if (M_AXI_ARREADY && axi_arvalid && read_detection_flag == 1'b1)                           
	      begin                                                          
	        axi_araddr <= axi_araddr + burst_size_bytes_read;               
	      end                                                            
	    else                                                             
	      axi_araddr <= axi_araddr;                                      
	  end                                                                


	//--------------------------------
	//Read Data (and Response) Channel
	//--------------------------------

	 // Forward movement occurs when the channel is valid and ready   
	  assign rnext = M_AXI_RVALID && axi_rready;                            
	                                                                        
	                                                                        
	// Burst length counter. Uses extra counter register bit to indicate    
	// terminal count to reduce decode logic                                
	  always @(posedge M_AXI_ACLK)                                          
	  begin                                                                 
	    if (M_AXI_ARESETN == 0  || init_txn_pulse == 1'b1|| start_single_burst_read)                  
	      begin                                                             
	        read_index <= 0;                                                
	      end                                                               
	    else if (rnext && (read_index != C_M_AXI_BURST_LEN_READ-1))              
	      begin                                                             
	        read_index <= read_index + 1;                                   
	      end                                                               
	    else                                                                
	      read_index <= read_index;                                         
	  end                                                                   
	                                                                        
	                                                                        
	/*                                                                      
	 The Read Data channel returns the results of the read request          
	                                                                        
	 In this example the data checker is always able to accept              
	 more data, so no need to throttle the RREADY signal                    
	 */                                                                     
	  always @(posedge M_AXI_ACLK)                                          
	  begin                                                                 
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                  
	      begin                                                             
	        axi_rready <= 1'b0;                                             
	      end                                                               
	    // accept/acknowledge rdata/rresp with axi_rready by the master     
	    // when M_AXI_RVALID is asserted by slave                           
	    else if (M_AXI_RVALID)                       
	      begin                                      
	         if (M_AXI_RLAST && axi_rready)          
	          begin                                  
	            axi_rready <= 1'b0;                  
	          end                                    
	         else                                    
	           begin                                 
	             axi_rready <= 1'b1;                 
	           end                                   
	      end                                        
	    // retain the previous value                 
	  end
	                                    
	                                                                                                                                       
	                                                                        
	//Flag any read response errors                                         
	  assign read_resp_error = axi_rready & M_AXI_RVALID & M_AXI_RRESP[1];  
                                        


	//----------------------------------
	//Example design error register
	//----------------------------------

	//Register and hold any data mismatches, or read/write interface errors 

	  always @(posedge M_AXI_ACLK)                                 
	  begin                                                              
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                          
	      begin                                                          
	        error_reg <= 1'b0;                                           
	      end                                                            
	    else if (write_resp_error || read_resp_error)   
	      begin                                                          
	        error_reg <= 1'b1;                                           
	      end                                                            
	    else                                                             
	      error_reg <= error_reg;                                        
	  end                                                                                                                                                           
	                                                                                                            
	                                                                                                            
	  //implement master command interface state machine                                                        
	                                                                                                           
	  always @ ( posedge M_AXI_ACLK )                                                                            
	  begin                                                                                                     
	    if (M_AXI_ARESETN == 1'b0 )                                                                             
	      begin                                                                                                 
	        // reset condition                                                                                  
	        // All the signals are assigned default values under reset condition                                
	        mst_exec_state      <= IDLE;                                                                
	        start_single_burst_write <= 1'b0;                                                                   
	        start_single_burst_read  <= 1'b0;                                                                                                                           
	        ERROR <= 1'b0;
	        all_done <= 1'b0;   
	      end                                                                                                   
	    else                                                                                                    
	      begin                                                                                                                                                                                                    
	        // state transition                                                                                 
	        case (mst_exec_state)
	          IDLE: begin                                                                                    
	            // This state is responsible to wait for user defined C_M_START_COUNT                           
	            // number of clock cycles.                                                                      
	            if ( init_txn_pulse == 1'b1)                                                      
	              begin                                                                                         
	                mst_exec_state  <= READ_OPERATION;                                                              
	                ERROR <= 1'b0;
	                //compare_done <= 1'b0;
	              end                                                                                           
	            else                                                                                            
	              begin                                                                                         
	                mst_exec_state  <= IDLE;                                                            
	              end
	              end                                                                                                                                                                                                                                                                                                                                                             
	                                                                                                            
	          READ_OPERATION:begin                                                                                        
	            // This state is responsible to issue start_single_read pulse to                                
	            // initiate a read transaction. Read transactions will be                                       
	            // issued until burst_read_active signal is asserted.                                           
	            // read controller        
                if (image_num == 'd5)                                                                                
	              begin                                                                                         
	                mst_exec_state <= DONE;//                                                           
	              end                
	            else if (M_AXI_RVALID && axi_rready && M_AXI_RLAST && read_detection_flag == 1'b1)                                                                                 
	              begin                                                                                         
	                mst_exec_state <= WRITE_OPERATION;                                                             
	              end                                                                                           
	            else                                                                                            
	              begin                                                                                         
	                mst_exec_state  <= READ_OPERATION;                                                                                                                                                     
	                if (~axi_arvalid && ~burst_read_active && ~start_single_burst_read)                         
	                  begin                                                                                     
	                    start_single_burst_read <= 1'b1;                                                        
	                  end                                                                                       
	               else                                                                                         
	                 begin                                                                                      
	                   start_single_burst_read <= 1'b0; //Negate to generate a pulse                            
	                 end                                                                                        
	              end
	              end
	              
              WRITE_OPERATION:begin                                                                                       
	            // This state is responsible to issue start_single_write pulse to                               
	            // initiate a write transaction. Write transactions will be                                     
	            // issued until burst_write_active signal is asserted.                                          
	            // write controller 

                if(row_num == (BMP_HEIGHT-1) && col_num == (BMP_WIDTH+4-1) && M_AXI_WREADY && axi_wvalid && axi_wlast)
                    mst_exec_state  <= WRITE_OPERATION;
//                else if (write_detection_flag == 1'b1 && write_finish_flag == 1'b1)
//                    begin
//                        mst_exec_state  <= READ_OPERATION;
//                        image_num <= image_num + 1;
//                    end
	            else if (M_AXI_WREADY & axi_wvalid && axi_wlast)
	                mst_exec_state  <= READ_OPERATION;                                                                                          
	            else                                                                                         
	              begin                                                                                         
	                mst_exec_state  <= WRITE_OPERATION;                                                              
	                                                                                                            
	                if (~axi_awvalid && ~start_single_burst_write && ~burst_write_active && (send_start_flag || write_detection_flag))                       
	                  begin                                                                                     
	                    start_single_burst_write <= 1'b1;                                                       
	                  end                                                                                       
	                else                                                                                        
	                  begin                                                                                     
	                    start_single_burst_write <= 1'b0; //Negate to generate a pulse                          
	                  end                                                                                       
	              end
	              end                                                                                             
	                                                                                                            
	          DONE:                                                                                                                                                                 
	            begin                                                                                         
                    ERROR <= error_reg;                                                         
                    all_done <= 1'b1;                                                                                        
                    mst_exec_state <= IDLE;//                                                             
                end                                                                                            
	          default :                                                                                         
	            begin                                                                                           
	              mst_exec_state  <= IDLE;                                                              
	            end                                                                                             
	        endcase                                                                                             
	      end                                                                                                   
	  end //MASTER_EXECUTION_PROC                                                                               
	                                                                                                            
	                                                                                                            
	  // burst_write_active signal is asserted when there is a burst write transaction                          
	  // is initiated by the assertion of start_single_burst_write. burst_write_active                          
	  // signal remains asserted until the burst write is accepted by the slave                                 
	  always @(posedge M_AXI_ACLK)                                                                              
	  begin                                                                                                     
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                                                                 
	      burst_write_active <= 1'b0;                                                                                                                                                                           
	    //The burst_write_active is asserted when a write burst transaction is initiated                        
	    else if (start_single_burst_write)                                                                      
	      burst_write_active <= 1'b1;                                                                           
	    else if (M_AXI_BVALID && axi_bready)                                                                    
	      burst_write_active <= 0;                                                                              
	  end
	  
      always @(posedge M_AXI_ACLK)                                                                              
	  begin                                                                                                     
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)                                                                                 
	      burst_read_active <= 1'b0;                                                                                                                                                                               
	    //The burst_write_active is asserted when a write burst transaction is initiated                        
	    else if (start_single_burst_read)                                                                       
	      burst_read_active <= 1'b1;                                                                            
	    else if (M_AXI_RVALID && axi_rready && M_AXI_RLAST)                                                     
	      burst_read_active <= 0;                                                                               
	    end                                                                                                         
	                                                                                                            
	 // read 1k image data     
      //将一个burst数据串转并作为输出  5个像素点的RGB888
      always @(posedge M_AXI_ACLK)                                       
	  begin                                                              
	    if (M_AXI_ARESETN == 0  || init_txn_pulse == 1'b1|| start_single_burst_read)                                          
	      begin                                                          
	        read_data <= 'd0;                                           
	      end                                                            
	    else if (rnext)                           
	      begin                                                          
	        case(read_index)
	           'd0:read_data[8*32-1-:32] <= M_AXI_RDATA;
	           'd1:read_data[7*32-1-:32] <= M_AXI_RDATA;
	           'd2:read_data[6*32-1-:32] <= M_AXI_RDATA;
	           'd3:read_data[5*32-1-:32] <= M_AXI_RDATA;
	           'd4:read_data[4*32-1-:32] <= M_AXI_RDATA;
               'd5:read_data[3*32-1-:32] <= M_AXI_RDATA;
	           'd6:read_data[2*32-1-:32] <= M_AXI_RDATA;
	           'd7:read_data[1*32-1-:32] <= M_AXI_RDATA;
                default:read_data <= read_data;
	        endcase 
	      end                                                            
	    else                                                             
	      read_data <= read_data;                                      
	  end
	  
      always @(posedge M_AXI_ACLK)                                          
	  begin                                                                 
	    if (M_AXI_ARESETN == 0  || init_txn_pulse == 1'b1|| start_single_burst_read)                  
	      begin                                                             
	        five_flag <= 1'b0;                                                
	      end                                                               
	    //else if (rnext && (read_detection_flag == 1'b0) && (read_index == 4))
	    else if (rnext && (read_index == 4)&&(read_detection_flag == 1'b1))               
	      begin                                                             
	        five_flag <= 1'b1;                                   
	      end                                                               
	    else                                                                
	      five_flag <= 1'b0;                                         
	  end  
	
	//read finish flag  
    always @(posedge M_AXI_ACLK)                                          
	  begin                                                                 
	    if (M_AXI_ARESETN == 0  || init_txn_pulse == 1'b1|| start_single_burst_read)                  
	      begin                                                             
	        read_finish_flag <= 1'b0;                                                
	      end                                                               
	    else if (rnext && (read_index == 7))              
	      begin                                                             
	        read_finish_flag <= 1'b1;                                   
	      end                                                               
	    else                                                                
	      read_finish_flag <= 1'b0;                                         
	  end 
	
	//write finish flag  
    always @(posedge M_AXI_ACLK)                                          
	  begin                                                                 
	    if (M_AXI_ARESETN == 0  || init_txn_pulse == 1'b1|| start_single_burst_write)                  
	      begin                                                             
	        write_finish_flag <= 1'b0;                                                
	      end                                                               
	    //else if (wnext && (write_detection_flag == 1'b1)  && (write_index == 15))
	    else if (wnext && (write_index == 15))               
	      begin                                                             
	        write_finish_flag <= 1'b1;                                   
	      end                                                               
	    else                                                                
	      write_finish_flag <= 1'b0;                                         
	  end 
	  
    //read detection flag  低电平表示在读状态下突发读标志位
    always @(posedge M_AXI_ACLK)                                          
	  begin                                                                 
	    if (M_AXI_ARESETN == 0  || init_txn_pulse == 1'b1 || interpolation_done)                  
	      begin                                                             
	        read_detection_flag <= 1'b0;                                                
	      end                                                               
	    else if (read_finish_flag && (read_data == expected_read_data))              
	      begin                                                             
	        read_detection_flag <= 1'b1;                                   
	      end                                                               
	    else                                                                
	      read_detection_flag <= read_detection_flag;                                         
	  end 
	  
    //write detection flag 高电平表示在写状态下突发写标志位
    always @(posedge M_AXI_ACLK)                                          
	  begin                                                                 
	    if (M_AXI_ARESETN == 0  || init_txn_pulse == 1'b1)                  
	      begin                                                             
	        write_detection_flag <= 1'b0;                                                
	      end
        else if (write_detection_flag == 1'b1 && write_finish_flag == 1'b1)              
	      begin                                                             
	        write_detection_flag <= 1'b0;                               
	      end                                                                
	    else if (interpolation_done)              
	      begin                                                             
	        write_detection_flag <= 1'b1;                                   
	      end                                                               
	    else                                                                
	      write_detection_flag <= write_detection_flag;                                         
	  end
	  
	  //the index of the image being processing
      always @(posedge M_AXI_ACLK)                                          
	  begin                                                                 
	    if (M_AXI_ARESETN == 0  || init_txn_pulse == 1'b1)                  
	      begin                                                             
	        image_num <= 'd0;                                                
	      end
        else if (write_detection_flag == 1'b1 && write_finish_flag == 1'b1)              
	      begin                                                             
	        image_num <= image_num + 1;                                
	      end                                                                                                                              
	    else                                                                
            image_num <= image_num;                                          
	  end
	 
	                                                                    
	 // write 4k image data                                                                                                           
	 // This logic is to qualify the last write count with the final write                                      
	 // response. This demonstrates how to confirm that a write has been                                        
	 // committed. 

	  always @(posedge M_AXI_ACLK)                                                                              
	  begin                                                                                                     
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)  
            img_4k_data<='d0;
        else if (write_detection_flag == 1'b1)
            img_4k_data <= expected_write_data;
        else if(send_flag==1'b1)
            img_4k_data<=IMG_4K_DATA;
        else
            img_4k_data<=img_4k_data;
      end
    
    reg send_flag_d;
      always @(posedge M_AXI_ACLK)                                                                              
	  begin                                                                                                     
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)
	        begin  
	            send_flag_d <= 'd0;
                send_start_flag <= 'd0;
            end
        else
            begin
                send_flag_d <= send_flag;
                send_start_flag<=send_flag_d;
            end
      end
      
//将发送的并行数据写成数组
    wire    [23:0]   img_4k_data_array[15:0];
    assign  img_4k_data_array[15]=img_4k_data[16*24-1:15*24];
    assign  img_4k_data_array[14]=img_4k_data[15*24-1:14*24];
    assign  img_4k_data_array[13]=img_4k_data[14*24-1:13*24];
    assign  img_4k_data_array[12]=img_4k_data[13*24-1:12*24];
    assign  img_4k_data_array[11]=img_4k_data[12*24-1:11*24];
    assign  img_4k_data_array[10]=img_4k_data[11*24-1:10*24];
    assign  img_4k_data_array[ 9]=img_4k_data[10*24-1: 9*24];
    assign  img_4k_data_array[ 8]=img_4k_data[ 9*24-1: 8*24];
    assign  img_4k_data_array[ 7]=img_4k_data[ 8*24-1: 7*24];
    assign  img_4k_data_array[ 6]=img_4k_data[ 7*24-1: 6*24];
    assign  img_4k_data_array[ 5]=img_4k_data[ 6*24-1: 5*24];
    assign  img_4k_data_array[ 4]=img_4k_data[ 5*24-1: 4*24];
    assign  img_4k_data_array[ 3]=img_4k_data[ 4*24-1: 3*24];
    assign  img_4k_data_array[ 2]=img_4k_data[ 3*24-1: 2*24];
    assign  img_4k_data_array[ 1]=img_4k_data[ 2*24-1: 1*24];
    assign  img_4k_data_array[ 0]=img_4k_data[ 1*24-1: 0*24];
//将模块输出的并行数据转为串行数据，由于时序逻辑落后地址一拍
      //reg [7:0]   axi_wdata;
	  always @(posedge M_AXI_ACLK)                                                                              
	  begin                                                                                                     
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1)  
            axi_wdata<='b0;
        else if (start_single_burst_write)
            axi_wdata <= img_4k_data_array[15];
        else if(M_AXI_WREADY && axi_wvalid)
            begin
                axi_wdata <= img_4k_data_array[14 - write_index];
            end
        else
            axi_wdata <= axi_wdata;
      end
	 
	 
	 
	 
	 //column counter
      always @(posedge M_AXI_ACLK)                                                                              
	  begin                                                                                                     
	    //if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1|| read_detection_flag == 1'b1 || write_detection_flag == 1'b1) 
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 || write_detection_flag == 1'b1)                                                                                
	      col_num <= 10'd0;                                                                                  
	    else if (col_num == (BMP_WIDTH+4-1) && M_AXI_WREADY && axi_wvalid && axi_wlast)                          
	      col_num <= 10'd0; 
        else if (M_AXI_WREADY && axi_wvalid && axi_wlast)                          
	      col_num <= col_num + 1;                                                                                   
	    else                                                                                                    
	      col_num <= col_num;                                                                           
	    end  
	    
      always @(posedge M_AXI_ACLK)                                                                              
	  begin                                                                                                     
	    //if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1|| read_detection_flag == 1'b1 || write_detection_flag == 1'b1)
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 || write_detection_flag == 1'b1)                                                                                 
	      row_num <= 10'd0;                                                                                  
        else if(row_num == (BMP_HEIGHT-1) && col_num == (BMP_WIDTH+4-1) && M_AXI_WREADY && axi_wvalid && axi_wlast)
          row_num <= 10'd0;
        else if(col_num == (BMP_WIDTH+4-1) && M_AXI_WREADY && axi_wvalid && axi_wlast)
          row_num <= row_num + 1;
        else
          row_num <= row_num;                                                                          
	    end
	    
      always @(posedge M_AXI_ACLK)                                                                              
	  begin                                                                                                     
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                                                                                 
	      interpolation_done <= 1'b0;                                                                                  
        else if(row_num == (BMP_HEIGHT-1) && col_num == (BMP_WIDTH+4-1) && M_AXI_WREADY && axi_wvalid && axi_wlast)
          interpolation_done <= 1'b1;
        else
          interpolation_done <= 1'b0;                                                                         
	    end
                                                                                    
	                                                                                                            
	  // burst_read_active signal is asserted when there is a burst write transaction                           
	  // is initiated by the assertion of start_single_burst_write. start_single_burst_read                     
	  // signal remains asserted until the burst read is accepted by the master                                 
                                                                                                   
                                                                                              

	// Add user logic here

	// User logic ends

	endmodule
