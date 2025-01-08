/*********************************************************************************
Example to demonstrate string datatypes and its in-built methods in SystemVerilog
*********************************************************************************/

module datatypes;

        string str_in;
        string str_lc;
        string str_c;
        string substring;
        string url;
        string substr;
        string substr_lc;
        string str_uc;


        initial begin
                str_in="Design Verification";
                $display("The length of the string str_in, str.len= %d", str_in.len);
                str_lc=str_in.tolower();
                $display("str_lc=%s", str_lc);
                $display("The character in 5th position is: %s",str_in.getc(5));
                str_c=str_in;
                str_c.putc(6,"-");
                $display("Modified str_in=%s", str_c);
                substring=str_in.substr(7,(str_in.len)-1);
                $display("Modified str_in=%s", substring);
                // substr=str_in.substr(0,2);
                // substr_lc=substr.tolower();
                url={{3{"w"}},".",str_c.tolower(),".com"};
                $display("url=%s", url);
                disp($sformatf("Final website URL==> https://%s",url));
                str_uc=str_in.toupper();
                $display("str_uc=%s", str_uc);
        end

        task disp(string s);
                $display("At time t=%0t, %s", $time, s);
        endtask: disp

endmodule: datatypes


/******************************************************
                    RESULTS
*******************************************************/
The length of the string str_in, str.len=          19
str_lc=design verification
The character in 5th position is: n
Modified str_in=Design-Verification
Modified str_in=Verification
url=www.design-verification.com
At time t=0, Final website URL==> https://www.design-verification.com
str_uc=DESIGN VERIFICATION