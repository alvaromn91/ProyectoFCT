   M S B A M L   `   `   `  ����=  9SZ, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:SZ.PagesSZ.Pages  5          SZ.Pages.Actividades   5      W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      (localclr-namespace:SZ.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Z VFontAwesome.WPF, Version=4.7.0.37774, Culture=neutral, PublicKeyToken=0758b07a11a4f466-fa$http://schemas.fontawesome.io/icons/  6P      MaterialDesignBody#���   5      $��Regular"�5	   	   $��13(�5
   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	    N� Title$ Actividades��5      .��5      � ���	#7FE8C56A � ColumnDefinitions 5   
   �� 5      $��* �6   �� 5      $��5* �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $	��10* �6   �� 5      $��* �6   .+�5   
   �� -   5         ��Name$ ParentContainer��5      $��1��6.   $��1��6;    �� Orientation$ Vertical=�6K   .+�5      �� -   5        $ ActivitiesRow1��5      $ 
Horizontal=�61   ��6J   �� 	 �� Path$	 	RowHeight�.+�5       �� -   5        $ RowOneItemOne��5       ��64   �� $	 	ItemWidth���6U   �� $	 	RowHeight�.+�5!      �� -   5        
 ��Name$
 
ImageGame1��5!      ��61   �� $	 ImageButton�6m   �� 5"      -   5        $
 ActionGame1��5"      $y�Hidden=�6k   ��62   �� $	 ActionButton�6�   5#      �� 5$      -   5        $ RowOneItemTwo��5$      ��64   �� $	 	ItemWidth���6U   �� $	 	RowHeight�.+�5%      �� -   5        $
 
ImageGame2��5%      ��61   �� $	 ImageButton�6m   �� 5&      -   5        $
 ActionGame2��5&      $y�Hidden=�6k   ��62   �� $	 ActionButton�6�   5'      �� 5(      -	   5        $ RowOneItemThree��5(      ��66   �� $	 	ItemWidth���6W   �� $	 	RowHeight�.+�5)      �� -
   5        $
 
ImageGame3��5)      ��61   �� $	 ImageButton�6m   �� 5*      -   5        $
 ActionGame3��5*      $y�Hidden=�6k   ��62   �� $	 ActionButton�6�   5+      5,      �� 5-      -   5        $ ActivitiesRow2��5-      $ 
Horizontal=�61   ��6J   �� $	 	RowHeight�.+�5.      �� -   5        $ RowTwoItemOne��5.      ��64   �� $	 	ItemWidth���6U   �� $	 	RowHeight�.+�5/      �� -   5        $
 
ImageGame4��5/      ��61   �� $	 ImageButton�6m   �� 50      -   5        $
 ActionGame4��50      $y�Hidden=�6k   ��62   �� $	 ActionButton�6�   51      �� 52      -   5        $ RowTwoItemTwo��52      ��64   �� $	 	ItemWidth���6U   �� $	 	RowHeight�.+�53      �� ��6   �� $	 ImageButton�6E   �� 54      $y�Hidden=�6C   ��6   �� $	 ActionButton�6Z   55      �� 56      -   5        $ RowTwoItemThree��56      ��66   �� $	 	ItemWidth���6W   �� $	 	RowHeight�.+�57      �� ��6   �� $	 ImageButton�6F   �� 58      $y�Hidden=�6B   ��6   �� $	 ActionButton�6Y   59      5:      �� 5;      -   5        $ ActivitiesRow3��5;      $ 
Horizontal=�61   ��6J   �� $	 	RowHeight�.+�5<      �� -   5        $ RowThreeItemOne��5<      ��66   �� $	 	ItemWidth���6W   �� $	 	RowHeight�.+�5=      �� ��6   �� $	 ImageButton�6C   �� 5>      $y�Hidden=�6B   ��6   �� $	 ActionButton�6X   5?      �� 5@      -   5        $ RowThreeItemTwo��5@      ��66   �� $	 	ItemWidth���6W   �� $	 	RowHeight�.+�5A      �� ��6   �� $	 ImageButton�6C   �� 5B      $y�Hidden=�6B   ��6   �� $	 ActionButton�6X   5C      �� 5D      -   5        $ RowThreeItemThree��5D      ��68   �� $	 	ItemWidth���6Y   �� $	 	RowHeight�.+�5E      �� ��6   �� $	 ImageButton�6C   �� 5F      $y�Hidden=�6B   ��6   �� $	 ActionButton�6X   5G      5H      5I      �� 5J   
   -   5        $
 
btn_back_1��5J      $y�Visible=�6<   $��20(�6Q   ���	#FFCC6649���	#FFCC6649$��50��6�   $	��170��6�   
�������$��
Bernard MT)�6�    � Cursor$
 Hand��6�   $��Atrás��6�   $��1��6�   $��1��6  $��506,314,10,10q�6  $��2��6%  5L      5M      