using System;
using System.Windows.Forms;

class Script
{
	[STAThread]
	static public void Main(string[] args)
	{
        void test() { }
		MessageBox.Show("Just a test!");

		for (int i = 0; i < args.Length; i++)
		{
			Console.WriteLine(args[i]);
		}
	}
}

