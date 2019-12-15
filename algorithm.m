%Sxediash TE 2 vathmidwn me eisodo N-MOS
%PRODIAGRAFES
x=27;
CL=(2+0.01*x)*10^(-12); %[F]
SRmin=(18+0.01*x)*10^6; %must be greater than [V/s] 
Vdd=(1.8+0.003*x); %[V]
Vss=-(1.8+0.003*x); %[V]
GBmin=(7+0.01*x)*10^6 ;%must be greater than [Hz] 
Amin=(20+0.01*x);%must be greater than [dB]
Pmax=(50+0.01*x)*10^(-3); %must be less than [W]

%stoixeia twn transistor 
Vinmax=0.1;
Vinmin=-0.1;
SR=SRmin;
Vtop=-0.9056;
Vton=0.7860;
Kp=2.9352*10^(-5);
Kn=9.6379*10^(-5);
Uop=180.2*10^(-4); %UO given [cm^2 / volt*sec] -> ..m^2..
Uon=591.7*10^(-4);
lp=0.05;
ln=0.04;

%algorithmos
GB=8*10^6;
SR=20*10^6;
L=1*10^(-6);

Cc=0.22*CL+2*10^(-12);

I5=SR*Cc;

S3=I5/(Kp*(Vdd-Vinmax-abs(Vtop)+Vton)^2);
if S3<1
    S3=1;  %h kai megalytero alla den theloume na megalosoume poly to tranz
    
end

W3=S3*L;
S4=S3;
I3=I5/2;

gm3=sqrt(2*Kp*S3*I3);
Cox=Kp/Uop;
Cgs3=0.667*W3*L*Cox;
p3=gm3/(2*Cgs3);
vima5=1;
if (p3<10*GB)  %vima 5
    msg='To vima 5 den ikanopoieitai';
    disp(msg);
    vima5=0;
end

gm1=2*pi*GB*Cc;
gm2=gm1;
S1=gm1^2/(Kn*I5);
S2=S1;


b1=Kn*S1;
Vds5=Vinmin-Vss-sqrt(I5/b1)-Vton;
S5=(2*I5)/(Kn*Vds5^2);

gm6=2.2*gm2*CL/Cc;
I4=I3;
gm4=sqrt(2*Kp*S4*I4);
S6=S4*gm6/gm4;

I6=(gm6^2)/(2*Kp*S6);

S7=(I6/I5)*S5;


Av=(2*gm2*gm6)/(I5*(ln+lp)*I6*(ln+lp));
Av=20*log(Av);
Pdiss=(I5+I6)*(Vdd+abs(Vss));
if(Av>Amin)
    disp('A mesa sta oria');
end
if(Pdiss<Pmax)
    disp('isxys mesa sta oria');
end
W1=L*S1;
W2=L*S2;
W3=L*S3;
W4=L*S4;
W5=L*S5;
W6=L*S6;
W7=L*S7;
W8=W5;
