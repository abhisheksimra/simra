x=0:.01:10;
y=x.^2;
net=newff(minmax(x),[20,1],{'logsig','purelin','trainlm'});
net.trainparam.epoch=200;
net.trainparam.goal=le25;
net.trainparam.lr=0.1;
net=train(net,x,y)

