% ************************************************************************
% File Name   : rpsa.m
%               (function m-file)
% Author      : Necati KARTAL
% Date        : 15.01.2015
% Description : This m-file will run 'Rotational Plane Sweep Algoritm' to 
%               calculate and draw 'Vicibility Graph' and shows step by
%               step.
%               Input : Vertices, Edges, Vertex Number
%               Output: Drawing visibility graph's roads.
% ************************************************************************

function rpsa( vertices, edges, vertexNumber)

flag=edges(1,1);
subedges = [];
index=1;

%Calculte subvertices and subedges by using vertex number.
for i=1:size(edges,1)
     if(vertexNumber == edges(i,1))
        for j=1:flag-1
            subedges(index,:)=edges(j,:);
            index = index+1;
        end
        for k=i:size(edges,1)-1
            if(flag == edges(k,2) && i <size(edges,1))
                flag = edges(k+1,1);
                for j=flag:size(edges,1)
                    subedges(index,:)=edges(j,:);
                    index = index+1;
                end
                break
            end
        end
        break
    end
    if(flag == edges(i,2) && i <size(edges,1))
       flag = edges(i+1,1);
    end
end

%Create subvertices.
subvertices = vertices(subedges(:,1),1:3);

%Create angles list.
for i=1:size(subvertices,1)
    E(i,:) =calculateAngle(vertices(vertexNumber,:),subvertices(i,:)); 
end

%Sort angles list.
E = sort(E);

%Run 'Rotatinal Plane Sweep Algoritm' by using line segments intersect
%algorithm which is check intersects between two edges.
for j=1:size(E,1)
    for i=1:size(subvertices,1) 
        if E(j) == calculateAngle(vertices(vertexNumber,1:2),subvertices(i,1:2)) %Find vertex number
            
            secondVertexNumber = subvertices(i,3); %Get first vertex to connect.
            edgelist=edges; %Copy edges.
            edgelist(any(edgelist' == secondVertexNumber),:) = []; %Clear own edges. 
            edgelist(any(edgelist' == vertexNumber),:) = []; %Clear own edges.
            
            flag=1;
            %Check all adges if intersect or not.
            for k=1:size(edgelist,1)
                if(isLineSegmentsIntersect( vertices(vertexNumber,1:2),vertices(secondVertexNumber,1:2),vertices(edgelist(k,1),1:2),vertices(edgelist(k,2),1:2) )==1)
                    flag=0;
                end
            end
           
            %If there is not an intersect then it's available to draw.
            if(flag==1)
                S = [[vertices(vertexNumber,1);vertices(vertexNumber,2)],[vertices(secondVertexNumber,1);vertices(secondVertexNumber,2)]];
                drawLine(S(:,1),S(:,2),'g');
            end 
        end
    end
    %To see step by step.
    %pause
end

end

