   M S B A M L   `   `   `  ����=  9SZ, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:SZ.PagesSZ.Pages  5          SZ.Pages.AddStudent   5      W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      (localclr-namespace:SZ.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5         MaterialDesignBody#���   5      $��Regular"�5	   	   $��13(�5
   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	    N� Title$ 
AddStudent��5      .��5      � ���	#7FE8C56A � ColumnDefinitions 5   
   �� 5      $��4* �6   �� 5      $��* �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��8* �6   �� 5      $��2* �6   .+�5   
   � $��1��6   $��0��6!   .+�5       ��  �� Orientation$ 
Horizontal=�6   $��Center=�62   $��	0,10,0,10q�6O   $��Center=�6b   .+�5!      �� -   5         ��Name$ tb_Name��5!      $��32(�6+   $	��280��69   )  #MaterialDesignThemes.Wpf.HintAssist	   Hint$	 Nombre��6E   $��Bernard MT Condensed)�6m   $��30q�6�   �� 5"      -   5        $��req_name��5"   %   $��*��6   $	��Top=�65   $��12(�6M   $	 Usuario��6[   $��Bernard MT Condensed)�6�   $y�Hidden=�6�   5#      �� 5$      $ 
Horizontal=�6   $��Center=�62   $��	0,10,0,10q�6O   $��Center=�6b   .+�5%      �� -   5        $ tb_Surname1��5%      $��32(�6/   $	��280��6=   $	 
Apellido 1��6I   $��Bernard MT Condensed)�6u   $��30q�6�   �� 5&      -   5        $��req_sn1��5&   %   $��*��6   $	��Top=�64   $��12(�6L   $	 Usuario��6Z   $��Bernard MT Condensed)�6�   $y�Hidden=�6�   5'      �� 5(      $ 
Horizontal=�6   $��Center=�62   $��	0,10,0,10q�6O   $��Center=�6b   .+�5)      �� -   5        $ tb_Surname2��5)      $��32(�6/   $	��280��6=   $	 
Apellido 2��6I   $��Bernard MT Condensed)�6u   $��30q�6�   �� 5*      -   5        $��req_sn2��5*   %   $��*��6   $	��Top=�64   $��12(�6L   $	 Usuario��6Z   $��Bernard MT Condensed)�6�   $y�Hidden=�6�   5+      �� 5,      $ 
Horizontal=�6   $��Center=�62   $��	0,10,0,10q�6O   $��Center=�6b   .+�5-      �� -   5        $ tb_Nationality��5-      $��32(�62   $	��280��6@   $	 Nacionalidad��6L   $��Bernard MT Condensed)�6z   $��30q�6�   �� 5.      -   5        $��req_nat��5.   %   $��*��6   $	��Top=�64   $��12(�6L   $	 Usuario��6Z   $��Bernard MT Condensed)�6�   $y�Hidden=�6�   5/      �� 50      $ 
Horizontal=�6   $��Center=�62   $��	0,10,0,10q�6O   $��Center=�6b   .+�51      �� -	   5        $ 
tb_Country��51      $��32(�6.   $	��280��6<   $	 País��6H   $��Bernard MT Condensed)�6n   $��30q�6�   �� 52      -
   5        $��req_cou��52   %   $��*��6   $	��Top=�64   $��12(�6L   $	 Usuario��6Z   $��Bernard MT Condensed)�6�   $y�Hidden=�6�   53      �� 54      $ 
Horizontal=�6   $��Center=�62   $��	0,10,0,10q�6O   $��Center=�6b   .+�55      �� -   5        $ tb_City��55      $��32(�6+   $	��280��69   $	 Ciudad��6E   $��Bernard MT Condensed)�6m   $��30q�6�   �� 56      -   5        $��req_cit��56   %   $��*��6   $	��Top=�64   $��12(�6L   $	 Usuario��6Z   $��Bernard MT Condensed)�6�   $y�Hidden=�6�   57      �� 58      $ 
Horizontal=�6   $��Center=�62   $��	0,10,0,10q�6O   $��Center=�6b   .+�59      �� -   5        $ tb_PostalCode��59      $��32(�61   $	��280��6?   $	 Código Postal��6K   $��Bernard MT Condensed)�6z   $��30q�6�   �� 5:      -   5        $��req_pos��5:   %   $��*��6   $	��Top=�64   $��12(�6L   $	 Usuario��6Z   $��Bernard MT Condensed)�6�   $y�Hidden=�6�   5;      �� 5<      $ 
Horizontal=�6   $��Center=�62   $��	0,10,0,10q�6O   $��Center=�6b   .+�5=      �� -   5        $ 
tb_Address��5=      $��32(�6.   $	��280��6<   $	 
Dirección��6H   $��Bernard MT Condensed)�6s   $��30q�6�   �� 5>      -   5        $��req_add��5>   %   $��*��6   $	��Top=�64   $��12(�6L   $	 Usuario��6Z   $��Bernard MT Condensed)�6�   $y�Hidden=�6�   5?      �� 5@      $ 
Horizontal=�6   $��Center=�62   $��	0,10,0,10q�6O   $��Center=�6b   .+�5A      �� -   5        $ tb_Email��5A      $��32(�6,   $	��280��6:   $	 Email��6F   $��Bernard MT Condensed)�6m   $��30q�6�   �� 5B      -   5        $��req_ema��5B   %   $��*��6   $	��Top=�64   $��12(�6L   $	 Usuario��6Z   $��Bernard MT Condensed)�6�   $y�Hidden=�6�   5C      �� 5E      -   5        $ 
tb_Medical��5E      $��24(�6*   $	��280��68   $	 Observaciones Médicas��6D   $��Bernard MT Condensed)�6{   $��30q�6�   $
��Auto=�6�   
 �� TextWrapping$

 Wrap=�6�   $	��172��6�   �� 5F      -   5        $ tb_Observations��5F      $��24(�6/   $	��280��6=   $	 Observaciones��6I   $��Bernard MT Condensed)�6x   $��30q�6�   $
��Auto=�6�   $

 Wrap=�6�   $	��172��6�   5G      �� 5H   
   $��1��6   $��1��6"   $	��Top=�63   $��Center=�6K   .+�5I      �� -   5         ��Name$ 	img_Photo��5I   .   $��/Images/mojo.png��6   $	��150��6A   �� 5J      -   5         ��Name$ 	btn_Image��5J      $��Center=�6(   $��20(�6C   ���	#FFCC6649���	#FFCC6649
�������$��30q�6�   $��50��6�   $	��170��6�   $��
Bernard MT)�6�    � Cursor$
 Hand��6�   .��6�   Agregar Imagen6  5K      �� 5L   
   -   5        $��req_cal��5L      $��*��6   $��Bottom=�6,   $��12(�6G   $��2��6U   $��0��6e   $	 Usuario��6r   $��Bernard MT Condensed)�6�   $y�	Collapsed=�6�   �� 5M   
   $��1��6   $��2��6"   $
��Left=�62   $	��Top=�6M   $��0,0,10,0q�6e   .+�5O      &   System.Windows.Controls.Calendar  -   5          Name$ 	cal_Birth��5O   7    J� RenderTransformOrigin$ 0.1,0.1&�6   z�5P      V� 5Q      .~�5R      ��  �� ScaleX$ 1Q�6)    �� ScaleY$ 1Q�64   �� 5S      �� 5T       �� Angle$ -0.241Q�6*   T� 5U      5V      5X      5Y      �� 5Z   
   $��2��6   $��0��6"   .+�5[      �� -   5         ��Name$ 	tb_forget��5[   U   $��Faltan Datos��6   $��0,50,0,0q�6,   $y�	Collapsed=�6>   $��32(�6h   $��Center=�6v   $��Bernard MT Condensed)�6�   $
��Bold"�6�   
���  ��6�   5\      �� 5]   
   $��2��6   $��0��6"   .+�5^      �� -   5        $ 
tb_sign_up��5^   Z   $��Alumno Registrado��6   $��0,50,0,0q�61   $y�	Collapsed=�6C   $��32(�6n   $��Center=�6|   $��Bernard MT Condensed)�6�   $
��Bold"�6�   ���	#FF0096886�   5_      �� 5a   
   -   5        $ 
btn_SignUp��5a      $��Center=�6?   $��10q�6\   $	��Top=�6h   $��20(�6�   ���	#FFCC6649���	#FFCC6649
�������$��50��6�   $	��170��6�   $��
Bernard MT)�6�   $
 Hand��6  $��2��6  $��2��6  .��6,  	Registrar67  �� 5b   
   -   5        $ 
btn_back_1��5b      $y�Visible=�6<   $��20(�6Q   ���	#FFCC6649���	#FFCC6649
�������$��
Bernard MT)�6�   $
 Hand��6�   $��Atrás��6�   $��2��6�   $��1��6�   $��50��6�   $	��170��6  $��Center=�6  $��10q�6+  $	��Top=�67  5c      5d      