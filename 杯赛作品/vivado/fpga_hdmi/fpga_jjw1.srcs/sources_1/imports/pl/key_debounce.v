module key_debounce(
    input        sys_clk ,
    input        sys_rst_n ,

    input        key ,         //�ⲿ����İ���ֵ
    output  reg  key_value ,   //������İ���ֵ
    output  reg  key_flag      //������İ���ֵ��Ч��־
);

//reg define
reg [19:0] cnt ;
reg        key_reg ;

//*****************************************************
//**                    main code
//*****************************************************

//����ֵ����
always @ (posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        cnt <= 20'd0;
        key_reg <= 1'b1;
    end
    else begin
        key_reg <= key;           //������ֵ�ӳ�һ��
        if(key_reg != key) begin  //�����ǰ����ֵ��ǰһ�ĵİ���ֵ��һ���������������»��ɿ�
            cnt <= 20'd100_0000;  //�򽫼�������Ϊ20'd100_0000��
                                  //����ʱ100_0000 * 20ns(1s/50MHz) = 20ms
        end
        else begin                //�����ǰ����ֵ��ǰһ������ֵһ����������û�з����仯
            if(cnt > 20'd0)       //��������ݼ���0
                cnt <= cnt - 1'b1;  
            else
                cnt <= 20'd0;
        end
    end
end

//������������յİ���ֵ�ͳ�ȥ
always @ (posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        key_value <= 1'b1;
        key_flag  <= 1'b0;
    end
	//�ڼ������ݼ���1ʱ�ͳ�����ֵ
    else if(cnt == 20'd1) begin
		key_value <= key;
		key_flag  <= 1'b1;
        end
    else begin
		key_value <= key_value;
		key_flag  <= 1'b0;
    end
end

endmodule
