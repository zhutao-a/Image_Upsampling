1、工程fpga_hdmi包含hdmi显示，为了实现分时显示，处理的图片数不能太大，此工程中设置处理图片数为5张，实际演示时可能会改动。
2、工程fpga不包含hdmi显示，此工程中设置处理图片数为10张，然后跳转至done状态，当然也可以将处理图片数设置为很大或删除done状态使得能一直处理图片。
注意：工程采用vivado2018.3编写，请保持相同编译环境以避免报错