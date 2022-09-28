function wave_eq_test(test)

switch test
    case 1
        J=10;N=20;
        fprintf('网格数:J=%i',J);
        fprintf(',N=%i \n',N);
        wave_Eq_Solver(2,J,N,2);
%         wave_Eq_Solver(1,J,N,1);
%         wave_Eq_Solver(1,J,N,2);
        J=10;N=10;
        fprintf('网格数:J=%i',J);
        fprintf(',N=%i \n',N);
        wave_Eq_Solver(2,J,N,2);
%         wave_Eq_Solver(ft,J,N,1);
%         wave_Eq_Solver(ft,J,N,2);
%         J=40;N=50;
%         fprintf('网格数:J=%i',J);
%         fprintf(',N=%i \n',N);
%         wave_Eq_Solver(1,J,N,0);
%         wave_Eq_Solver(1,J,N,1);
%         wave_Eq_Solver(1,J,N,2);
%         
%         J=8;N=10;
%         fprintf('网格数:J=%i',J);
%         fprintf(',N=%i \n',N);
%         wave_Eq_Solver(1,J,N,0);
%         wave_Eq_Solver(1,J,N,1);
%         wave_Eq_Solver(1,J,N,2);
    case 2
        ft=1;
        J=400;N=400;
        fprintf('网格数:J=%i',J);
        fprintf(',N=%i \n',N);
        wave_Eq_Solver(ft,J,N,0);
        wave_Eq_Solver(ft,J,N,1);
        wave_Eq_Solver(ft,J,N,2);
        
%         J=40;N=40;
%         fprintf('网格数:J=%i',J);
%         fprintf(',N=%i \n',N);
%         wave_Eq_Solver(ft,J,N,0);
%         wave_Eq_Solver(ft,J,N,1);
%         wave_Eq_Solver(ft,J,N,2);
%         
%         J=10;N=10;
%         fprintf('网格数:J=%i',J);
%         fprintf(',N=%i \n',N);
%         wave_Eq_Solver(ft,J,N,0);
%         wave_Eq_Solver(ft,J,N,1);
%         wave_Eq_Solver(ft,J,N,2);
    case 3
        ft=1;
        J=400;N=500;
        fprintf('网格数:J=%i',J);
        fprintf(',N=%i \n',N);
        wave_Eq_Solver2(ft,J,N,0.0,0);
        wave_Eq_Solver2(ft,J,N,0.1,0);
        wave_Eq_Solver2(ft,J,N,0.2,0);
        wave_Eq_Solver2(ft,J,N,0.25,0);
        
        J=400;N=400;
        fprintf('网格数:J=%i',J);
        fprintf(',N=%i \n',N);
        wave_Eq_Solver2(ft,J,N,0.0,0);
        wave_Eq_Solver2(ft,J,N,0.1,0);
        wave_Eq_Solver2(ft,J,N,0.2,0);
        wave_Eq_Solver2(ft,J,N,0.25,0);
%         
%         J=401;N=400;
%         fprintf('网格数:J=%i',J);
%         fprintf(',N=%i \n',N);
%         wave_Eq_Solver2(ft,J,N,0.0,0);
%         wave_Eq_Solver2(ft,J,N,0.1,0);
%         wave_Eq_Solver2(ft,J,N,0.2,0);
%         wave_Eq_Solver2(ft,J,N,0.25,0);
%         
%         J=600;N=400;
%         fprintf('网格数:J=%i',J);
%         fprintf(',N=%i \n',N);
%         wave_Eq_Solver2(ft,J,N,0.0,0);
%         wave_Eq_Solver2(ft,J,N,0.1,0);
%         wave_Eq_Solver2(ft,J,N,0.2,0);
%         wave_Eq_Solver2(ft,J,N,0.25,0);
%         
%         J=1000;N=400;
%         fprintf('网格数:J=%i',J);
%         fprintf(',N=%i \n',N);
%         wave_Eq_Solver2(ft,J,N,0.0,0);
%         wave_Eq_Solver2(ft,J,N,0.1,0);
%         wave_Eq_Solver2(ft,J,N,0.2,0);
%         wave_Eq_Solver2(ft,J,N,0.25,0);
end