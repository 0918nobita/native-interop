using System;
using System.Runtime.InteropServices;

namespace native_interop
{
    class Program
    {
        [DllImport("../shared_library/libmylib.so")]
        private static extern int my_func();

        static void Main(string[] args)
        {
            int status = my_func();
            Console.WriteLine(status);
        }
    }
}
