function B = erlangbSimul(N,lambda,mean_hold)
%N:the number of channels lambda:Average call arrival rate
%Mean_hold:Average call duration
number=length(mean_hold);
B=zeros(1,number);
Number=100000;%the number of simulated calls
for ii=1:number
    Mean_TN = ones(1,Number).*1/lambda;
    TN=exprnd(Mean_TN); %create matrix of interval time
    Mean_hold=ones(1,Number).*mean_hold(1,ii);
    Hold=exprnd(Mean_hold);%create matrix of hold time
    leave_monent=zeros(1,Number);
    for i=1:Number %create leave_monent of each calls of matrix
    index=sub2ind(size(leave_monent),1,i);
    leave_monent(index)=sum(TN(:,1:i),2)+Hold(1,i);
    end

    t=0;calls=zeros(1,Number);Occupied=0;Block=0;
    %Occupied:the number of occupied channels 
    %Block:Occupied:the number of blocked calls
    for i1=1:Number
        t=t+TN(1,i1);
        for i2 = 1:i1
            if (calls(1,i2) == 1)&&(t>leave_monent(1,i2)) 
                %Detect calls that should be released
                calls(1,i2) = 0;
                Occupied=Occupied-1;
            end
        end
        if Occupied < N
            calls(1,i1)=1;%%Channel access call
            Occupied=Occupied+1;
        else 
            Block=Block+1;
        end
    end
    B(1,ii)=Block./Number;
end