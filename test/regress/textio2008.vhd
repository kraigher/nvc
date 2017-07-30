entity textio2008 is
end entity;

use std.textio.all;

architecture test of textio2008 is
begin

    process is
        file fptr : text;
        variable l : line;
    begin
        file_open(fptr, "tmp.txt", WRITE_MODE);
        write(l, string'("0123"));
        tee(fptr, l);
        write(l, string'("4567"));
        tee(fptr, l);
        assert l'length = 0;
        file_close(fptr);

        file_open(fptr, "tmp.txt", READ_MODE);
        readline(fptr, l);
        assert l.all = "0123";
        readline(fptr, l);
        assert l.all = "4567";
        file_close(fptr);
        wait;
    end process;

end architecture;
