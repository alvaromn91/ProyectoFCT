   M S B A M L   `   `   `  ����=  9SZ, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:SZ.PagesSZ.Pages  5          SZ.Pages.DeleteStudent   5      W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      (localclr-namespace:SZ.Pages     5      Z VFontAwesome.WPF, Version=4.7.0.37774, Culture=neutral, PublicKeyToken=0758b07a11a4f466-fa$http://schemas.fontawesome.io/icons/  5      _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	      MaterialDesignBody#���   5	   	   $��Regular"�5
   	   $��13(�5   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	    N� Title$ DeleteStudent��5      .��5      � ���	#7FE8C56A � ColumnDefinitions 5   
   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��8* �6   �� 5      $��2* �6   .+�5   
   �� $��0��6   $��0��6"   $��Center=�62   $��4��6O   .+�5       �� $��Eliminar Estudiante��6   $��50(�62   $��Bernard MT Condensed)�6@   5!      � 5#   
   -   5         �Name$ 	sp_Search��5#   �   $��1��6   $��4��6!   $��Center=�65    � Orientation$ 
Horizontal=�6R   $y�Visible=�6k   .+�5$      �� 	 �� Orientation$	 
Horizontal=�6   $��Center=�62   $��50q�6O   $��Center=�6[   $��0��6v   $��1��6�   .+�5%      �� -   5        
 ��Name$
 tb_Name��5%      $��50(�6+   $	��400��69   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Nombre��6E   $��Bernard MT Condensed)�6m   $��30q�6�   �� 5&      -   5        $��req_name��5&   %   $��*��6   $	��Top=�65   $��12(�6M   $ Usuario��6[   $��Bernard MT Condensed)�6�   $y�Hidden=�6�   5'      �� 5(      $	 
Horizontal=�6   $��Center=�62   $��50q�6O   $��Center=�6[   $��1��6v   $��1��6�   .+�5)      �� -   5        $
 tb_SN1��5)      $��50(�6*   $	��400��68   $ 
Apellido 1��6D   $��Bernard MT Condensed)�6p   $��30q�6�   �� 5*      -   5        $��req_SN1��5*   %   $��*��6   $	��Top=�64   $��12(�6L   $ Usuario��6Z   $��Bernard MT Condensed)�6�   $y�Hidden=�6�   5+      �� 5,      $	 
Horizontal=�6   $��Center=�62   $��50q�6O   $��Center=�6[   $��2��6v   $��1��6�   .+�5-      �� -   5        $
 tb_SN2��5-      $��50(�6*   $	��400��68   $ 
Apellido 2��6D   $��Bernard MT Condensed)�6p   $��30q�6�    � Cursor$ IBeam��6�   �� 5.      -   5        $��req_SN2��5.   %   $��*��6   $	��Top=�64   $��12(�6L   $ Usuario��6Z   $��Bernard MT Condensed)�6�   $y�Hidden=�6�   5/      �� 50      -   5         ��Name$ 
btn_delete��50      $��Center=�6B   $��50q�6_   $��Center=�6k   $��40(�6�   ���	#FFCC6649���	#FFCC6649
�������$��50��6�   $	��300��6�   $��
Bernard MT)�6�   $
 Hand��6  $��2��6  $��2��6%  .��62  
Eliminar6<  51      �� 52   
   $��2��6   $��0��6"   $��3��62   $��Stretch=�6F   $y�Hidden=�6b   .+�53      �� -	   5         ��Name$ 	tb_delete��53   W   $��Alumno Borrado��6   $��0,50,0,0q�6.   $y�	Collapsed=�6@   $��50(�6j   $��Center=�6x   $��Bernard MT Condensed)�6�   $
��Bold"�6�   ���	#FF009688$	��Top=�6�   �� 54      -
   5        $ tb_non_deleted��54   g   $%��No se ha borrado ningún alumno��6   $��0,50,0,0q�6>   $y�	Collapsed=�6P   $��50(�6   $��Center=�6�   $��Bernard MT Condensed)�6�   $
��Bold"�6�   
���  ��$	��Top=�6�   55      �� 56   
   -   5        $ 
btn_back_1��56      $y�Visible=�6<   $��20(�6Q   ���	#FFCC6649���	#FFCC6649
�������$��
Bernard MT)�6�   $��50��6�   $	��300��6�   $
 Hand��6�   $��Atrás��6�   $��10,10,86,40q�6�   $��2��6  $��2��6  57      58      