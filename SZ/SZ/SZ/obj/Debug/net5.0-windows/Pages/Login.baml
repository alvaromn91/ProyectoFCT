   M S B A M L   `   `   `  ����=  9SZ, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:SZ.PagesSZ.Pages  5          SZ.Pages.Login   5      W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      (localclr-namespace:SZ.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5         MaterialDesignBody#���   5   	   $��Regular"�5	   	   $��13(�5
   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	    N� Title$ Login��5      .��5      � ���	#7FE8C56A.+�5   
   �� $��	0,0,150,0q�6   .+�5      ��  �� Orientation$ 
Horizontal=�6   $��Center=�62   $��Center=�6O   $��
0,120,0,10q�6j   .+�5      �� $��Elija su rol: ��6   $��32(�61   $��Bernard MT Condensed)�6?   �� 5      -   5         ��Name$ cmb_Type��5   )   $��32(�6   .@�5      �� -   5        $��P��5   #   .��6,   Padre/Madre/Tutor Legal6E   �� 5      -   5        $��S��5   #   .��6,   
Estudiante68   �� 5      -   5        $��T��5   #   .��6,   	Docente65   �� 5      -   5        $��M��5   #   .��6,   	Manager65   5      5      �� 5      $ 
Horizontal=�6   $��Center=�62   $��	0,10,0,10q�6O   $��Center=�6b   .+�5      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Account=�6*   $��Center=�69   $��0,0,5,0q�6T   $��30��6e   $��30��6q   �� 5       -   5         ��Name$ tb_User��5       $��32(�6+   $	��280��69   )  #MaterialDesignThemes.Wpf.HintAssist	   Hint$	 Usuario��6E   $��Bernard MT Condensed)�6n   �� 5!      -   5        $
��req1��5!   %   $��*��6   $	��Top=�61   $��12(�6I   $	 Usuario��6W   $��Bernard MT Condensed)�6�   $y�Hidden=�6�   5"      �� 5#      -   5        
 ��Name$

 Pass��5#   �   $ 
Horizontal=�6   $��Center=�62   $��	0,10,0,10q�6O   $��Center=�6b   $y�Visible=�6}   .+�5$        $ Password=�6*   $��Center=�6:   $��0,0,5,0q�6U   $��30��6f   $��30��6r   G� 5%      -	   5         G�Name$ tb_Pass��5%      $��32(�6/   $	��280��6=   $	 Contraseña��6I    � Cursor$ IBeam��6u   $��Bernard MT Condensed)�6�   �� 5&      -
   5        $
��req2��5&   %   $��*��6   $	��Top=�61   $��12(�6I   $	 Usuario��6W   $��Bernard MT Condensed)�6�   $y�Hidden=�6�   5'      �� 5(      -   5        $
 stp_Recover��5(   y   $ 
Horizontal=�6   $��Center=�62   $��	0,10,0,10q�6O   $y�	Collapsed=�6b   $��Center=�6�   .+�5)        $ Password=�6*   $��Center=�6:   $��0,0,5,0q�6U   $��30��6f   $��30��6r   G� 5*      -   5        $ tb_New_Pass��5*      $��32(�63   $	��280��6A   $	 Nueva Contraseña��6M   $ IBeam��6   $��Bernard MT Condensed)�6�   5+      �� 5,      -   5        $
 stp_btn��5,   �   $ 
Horizontal=�6   $��Center=�62   $��0,20,0,0q�6O   $��Center=�6a   $y�Visible=�6|   .+�5-      �� -   5         ��Name$ 	btn_Login��5-      $��Center=�6,   $��20(�6G   ���	#FFCC6649���	#FFCC6649
�������$��0,0,10,0q�6�   $��50��6�   $	��170��6�   $��
Bernard MT)�6�   $
 Hand��6�   .��6�   Iniciar Sesión6  �� 5.      -   5        $ btn_Recover��5.      $��Center=�6.   $��10,0,0,0q�6I   $��20(�6[   ���	#FFCC6649���	#FFCC6649
�������$
 Hand��6�   $��50��6�   $	��230��6�   $��
Bernard MT)�6�   .��6�   Olvidé mi Contraseña6   5/      �� 50      -   5        $
 Change��50   �   $ 
Horizontal=�6   $��Center=�62   $��0,20,0,0q�6O   $��Center=�6a   $y�	Collapsed=�6|   .+�51      �� -   5        $ btn_Pass_Change��51      $��Center=�62   $��20(�6M   ���	#FFCC6649���	#FFCC6649
�������$��50��6�   $	��230��6�   $��
Bernard MT)�6�   $
 Hand��6�   .��6�   Cambiar Contraseña6�   52      �� 53      .+�54      �� -   5         ��Name$ tb_wrong_pass��54   �   $��Contraseña incorrecta��6     flashAnimation#���  69   $��0,50,0,0q�6b   $y�	Collapsed=�6t   $��32(�6�   $��Center=�6�   $��Bernard MT Condensed)�6�   $
��Bold"�6�   
���  ��6  55      56      57      58      