   M S B A M L   `   `   `  ����=  9SZ, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:SZ.PagesSZ.Pages  5          SZ.Pages.GetStudent   5      W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      (localclr-namespace:SZ.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Z VFontAwesome.WPF, Version=4.7.0.37774, Culture=neutral, PublicKeyToken=0758b07a11a4f466-fa$http://schemas.fontawesome.io/icons/  6P      MaterialDesignBody#���   5      $��Regular"�5	   	   $��13(�5
   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	    N� Title$ 
GetStudent��5      .��5      � ���	#7FE8C56A � ColumnDefinitions 5   
   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��2* �6   �� 5      $��5* �6   .+�5   
   �� $��0��6   $��0��6"   $��Center=�62   $��4��6O   .+�5       �� $��Buscar Estudiante��6   $��50(�60   $��Bernard MT Condensed)�6>   5!      �� 5"   
   -   5         ��Name$ 	sp_Search��5"   �   $��1��6   $��4��6"   $��Center=�66    �� Orientation$ 
Horizontal=�6S   $y�Visible=�6l   .+�5#      �� $ 
Horizontal=�6   $��Center=�62   $��	0,10,0,10q�6O   $��Center=�6b   $��0��6}   $��1��6�   .+�5$      �� -   5        	 ��Name$	 tb_Name��5$      $��32(�6/   $	��280��6=   )  #MaterialDesignThemes.Wpf.HintAssist
   Hint$
 Nombre��6I   $��Bernard MT Condensed)�6q   $��30q�6�   �� 5%      -   5        $��req_name��5%   )   $��*��6    $	��Top=�69   $��12(�6Q   $
 Usuario��6_   $��Bernard MT Condensed)�6�   $y�Hidden=�6�   5&      �� 5'      $ 
Horizontal=�6   $��Center=�62   $��	0,10,0,10q�6O   $��Center=�6b   $��1��6}   $��1��6�   .+�5(      �� -   5        $	 tb_SN1��5(      $��32(�6*   $	��280��68   $
 
Apellido 1��6D   $��Bernard MT Condensed)�6p   $��30q�6�   �� 5)      -   5        $��req_SN1��5)   %   $��*��6   $	��Top=�64   $��12(�6L   $
 Usuario��6Z   $��Bernard MT Condensed)�6�   $y�Hidden=�6�   5*      �� 5+      $ 
Horizontal=�6   $��Center=�62   $��	0,10,0,10q�6O   $��Center=�6b   $��2��6}   $��1��6�   .+�5,      �� -   5        $	 tb_SN2��5,      $��32(�6*   $	��280��68   $
 
Apellido 2��6D   $��Bernard MT Condensed)�6p   $��30q�6�    � Cursor$ IBeam��6�   �� 5-      -   5        $��req_SN2��5-   %   $��*��6   $	��Top=�64   $��12(�6L   $
 Usuario��6Z   $��Bernard MT Condensed)�6�   $y�Hidden=�6�   5.      �� 5/      -   5         ��Name$ 
btn_Search��5/      $��Center=�6B   $��10q�6_   $��Center=�6k   $��20(�6�   ���	#FFCC6649���	#FFCC6649
�������$��50��6�   $	��170��6�   $��
Bernard MT)�6�   $
 Hand��6  $��2��6  $��2��6%  .��62  Buscar6:  50      � 51   
   -	   5         �Name$ sp_Data��51   �   $��1��6   $��4��6!   $��2��65   $��Center=�6F    � Orientation$ 
Horizontal=�6c   $y�	Collapsed=�6|   .+�52      �� $ 
Horizontal=�6   $��30q�62   .+�53      �� $��32(�6   $	��280��6*   $��Nombre: ��66   $��Bernard MT Condensed)�6F   ���	#FFCC66496i   �� 54      -
   5         ��Name$ tbk_name��54      $��32(�6.   $	��280��6<   $��Bernard MT Condensed)�6c   ��6H   ��  �� Path$
 Name�6c   55      �� 56      $ 
Horizontal=�6   $��30q�62   .+�57      �� $��32(�6   $	��280��6*   $��Apellido 1: ��66   $��Bernard MT Condensed)�6J   ���	#FFCC66496m   �� 58      -   5        $ tbk_SN1��58      $��32(�6-   $	��280��6;   $��Bernard MT Condensed)�6f   ��6G   �� $ Surname1�6f   59      �� 5:      $ 
Horizontal=�6   $��30q�62   .+�5;      �� $��32(�6   $	��280��6*   $��Apellido 2: ��66   $��Bernard MT Condensed)�6J   ���	#FFCC66496m   �� 5<      -   5        $ tbk_SN2��5<      $��32(�6-   $	��280��6;   $��Bernard MT Condensed)�6f   ��6G   �� $ Surname2�6f   5=      �� 5>      $ 
Horizontal=�6   $��30q�62   .+�5?      �� $��32(�6   $	��280��6*   $��Fecha Nac.: ��66   $��Bernard MT Condensed)�6J   ���	#FFCC66496m   �� 5@      -   5        $ 	tbk_birth��5@      $��32(�6/   $	��280��6=   $��Bernard MT Condensed)�6k   ��6I   �� $ StringBirth�6k   5A      �� 5B      $ 
Horizontal=�6   $��30q�62   .+�5C      �� $��32(�6   $	��280��6*   $��Nacionalidad: ��66   $��Bernard MT Condensed)�6L   ���	#FFCC66496o   �� 5D      -   5        $ tbk_Nationality��5D      $��32(�65   $	��280��6C   $��Bernard MT Condensed)�6q   ��6O   �� $ Nationality�6q   5E      �� 5F      $ 
Horizontal=�6   $��30q�62   .+�5G      �� $��32(�6   $	��280��6*   $��País: ��66   $��Bernard MT Condensed)�6D   ���	#FFCC66496g   �� 5H      -   5        $ tbk_Country��5H      $��32(�61   $	��280��6?   $��Bernard MT Condensed)�6i   ��6K   �� $ Country�6i   5I      �� 5J      $ 
Horizontal=�6   $��30q�62   .+�5K      �� $��32(�6   $	��280��6*   $��Ciudad: ��66   $��Bernard MT Condensed)�6F   ���	#FFCC66496i   �� 5L      -   5        $ tbk_City��5L      $��32(�6.   $	��280��6<   $��Bernard MT Condensed)�6c   ��6H   �� $
 City�6c   5M      �� 5N      $ 
Horizontal=�6   $��30q�62   .+�5O      �� $��32(�6   $	��280��6*   $��Código Postal: ��66   $��Bernard MT Condensed)�6M   ���	#FFCC66496p   �� 5P      -   5        $ tbk_PostalCode��5P      $��32(�64   $	��280��6B   $��Bernard MT Condensed)�6o   ��6N   �� $ 
PostalCode�6o   5Q      �� 5R      $ 
Horizontal=�6   $��30q�62   .+�5S      �� $��32(�6   $	��280��6*   $��Dirección: ��66   $��Bernard MT Condensed)�6I   ���	#FFCC66496l   �� 5T      -   5        $ tbk_Address��5T      $��32(�61   $	��280��6?   $��Bernard MT Condensed)�6i   ��6K   �� $ Address�6i   5U      �� 5V      $ 
Horizontal=�6   $��30q�62   .+�5W      �� $��32(�6   $	��280��6*   $��Email: ��66   $��Bernard MT Condensed)�6E   ���	#FFCC66496h   �� 5X      -   5        $ 	tbk_Email��5X      $��32(�6/   $	��280��6=   $��Bernard MT Condensed)�6e   ��6I   �� $ Email�6e   5Y      �� 5Z      $ 
Horizontal=�6   $��30q�62   .+�5[      �� $��32(�6   $	��280��6*   $��Obs. Médicas: ��66   $��Bernard MT Condensed)�6L   ���	#FFCC66496o   �� 5\      -   5        $ tbk_Medical��5\      $��24(�61   $	��280��6?   $��Bernard MT Condensed)�6i   $
��Auto=�6�   $
��Wrap=�6�   $	��172��6�   ��6K   �� $ Medical�6�   5]      �� 5^      $ 
Horizontal=�6   $��30q�62   .+�5_      �� $��32(�6   $	��280��6*   $��Observaciones: ��66   $��Bernard MT Condensed)�6M   ���	#FFCC66496o   �� 5`      -   5        $ tbk_Observations��5`      $��24(�66   $	��280��6D   $��Bernard MT Condensed)�6s   $
��Auto=�6�   $
��Wrap=�6�   $	��172��6�   ��6P   �� $ Observations�6�   5a      �� 5b      $��30q�6   .+�5c      �� -   5        $ btn_back��5c      $��Center=�6B   $��10q�6_   $y�Visible=�6k   $��Center=�6�   $��20(�6�   ���	#FFCC6649���	#FFCC6649
�������$��50��6�   $	��170��6�   $��
Bernard MT)�6  $
 Hand��6  .��6*  Atrás61  5d      �� 5e      -   5        $	��100��5e      $��80��6!   $��20(�6-   ���	#FFCC6649���	#FFCC6649
�������$��0,0,10,0q�6}   $��
Bernard MT)�6�   ��5f      "  FontAwesome.WPF.ImageAwesome  5g         Icon$ search=�6&      
Foreground
 �����$��40��6K   $��40��6V    J� RenderTransformOrigin$ 0.601,-0.133&�6b   5i      5j      �� 5k   
   $��2��6   $��1��6"   $��2��62   .+�5l      �� -   5        $ 
btn_back_1��5l      $��Center=�6@   $��10q�6]   $y�Visible=�6i   $��Center=�6~   $��20(�6�   ���	#FFCC6649���	#FFCC6649
�������$��50��6�   $	��170��6�   $��
Bernard MT)�6  $
 Hand��6  .��6(  Atrás6/  5m      5n      5o      