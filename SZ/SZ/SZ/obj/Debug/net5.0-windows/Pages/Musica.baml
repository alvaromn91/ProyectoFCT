   M S B A M L   `   `   `  ����=  9SZ, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:SZ.PagesSZ.Pages  5          SZ.Pages.Musica   5      W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      (localclr-namespace:SZ.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5         MaterialDesignBody#���   5      $��Regular"�5	   	   $��13(�5
   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	    N� Title$ Musica��5      .��5      � ���	#7FE8C56A � ColumnDefinitions 5   
   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��5* �6   �� 5      $��5* �6   .+�5   
   �� $��0��6   $��0��6"   $��3��62   $��Center=�6F   .+�5      �� $��Control de Música��6   $��50(�60   $��Bernard MT Condensed)�6>   5       �� 5!   
   $��1��6   $��3��6"    �� Orientation$ 
Horizontal=�66   $��Center=�6O   .+�5"      �� -   5         ��Name$ 	btn_Pause��5"      $
��Left=�6@   $��60��6b   $��30q�6n   ���	#B2E8C56A���	#B2E8C56A.��5#      �� $ 
Horizontal=�6   .+�5$      �� $��../Images/pause.png��6   $��50��69   $��50��6D   $
��Left=�6P   $��Center=�6k   $��0,0,0,0q�6�   5%      5&      �� 5'      -   5        $ btn_play��5'      $
��Left=�6>   $��60��6`   $��30q�6l   ���	#B2E8C56A���	#B2E8C56A.��5(      �� $ 
Horizontal=�6   .+�5)      �� $��../Images/play.png��6   $��50��68   $��50��6C   $
��Left=�6O   $��Center=�6j   $��0,0,0,0q�6�   5*      5+      �� 5,      -   5        $ btn_stop��5,      $
��Left=�6>   $��60��6`   $��30q�6l   ���	#B2E8C56A���	#B2E8C56A.��5-      �� $ 
Horizontal=�6   .+�5.      �� $��../Images/stop.png��6   $��50��68   $��50��6C   $
��Left=�6O   $��Center=�6j   $��0,0,0,0q�6�   5/      50      51      �� 52   
   $��2��6   $��3��6"   $��Center=�66   $ 
Horizontal=�6S   .+�53      �� 	 � Maximum$	 1Q�6   
 � Minimum$
 0Q�6!    � Cursor$
 Hand��6-   $
{�True��6;   $	��500��6L   $��Center=�6X   $��Stretch=�6s    � Value$	 0.5Q�6�   54      55      56      