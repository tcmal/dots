Sample hello.xaml.cs demonstrates the use of the custom compiler/code provider (CSSCodeProvider.v4.0.dll) for handling WPF code. 
The custom MSBuild base compiler is required because MS haven't released any public compiler for XAML. Thus the only option available is to use MSBuild, which is slow, bulky and hard to deal with. 

An alternative and arguably a better approach is to load XAML dynamically without compiling it into BALM. The sample DynamicWPF demonstrates the technique. 