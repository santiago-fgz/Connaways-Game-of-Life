function ngrid =  new_grid(ogrid,n)
    % new grid after game of life rules are applied, i.e next generation
    
    ngrid = zeros(n);
    if n>1
        
        for row = 1:n
           for col = 1:n
               ngrid(row,col) = live_state(ogrid,n,row,col);
           end
        end
             
    end
end

function s = live_state(grid,n,row,col)
    s = 0;
    neigh = 0;
    
    if row == 1
        if col == 1
            %a1
            neigh = grid(row,col+1) + grid(row+1,col+1) + grid(row+1,col);
        else
            if col == n
                %a2
                neigh = grid(row,col-1) + grid(row+1,col-1) +grid (row+1,col);
            else
                %b1
                neigh = grid(row,col-1) + grid(row+1,col-1) + grid(row+1,col) + grid(row+1,col+1) + grid(row,col+1);
            end
        end
    else
        if row == n
           if col == 1
               %a3
               neigh = grid(row-1,col) + grid(row-1,col+1) + grid(row,col+1);
           else
               if col == n
                   %a4
                   neigh = grid(row-1,col) + grid(row-1,col-1) + grid(row,col-1);
               else
                   %b3
                   neigh = grid(row,col-1) + grid(row-1,col-1) + grid(row-1,col) + grid(row-1,col+1) + grid(row,col+1);
               end
           end
        else
            if col == 1
               %b4
               neigh = grid(row-1,col) + grid(row-1,col+1) + grid(row,col+1) + grid(row+1,col+1) + grid(row+1,col);
           else
               if col == n
                   %b2
                   neigh = grid(row-1,col) + grid(row-1,col-1) + grid(row,col-1) + grid(row+1,col-1) + grid(row+1,col);
               else
                   %c
                   neigh = grid(row-1,col) + grid(row-1,col-1) + grid(row,col-1) + grid(row+1,col-1) + grid(row+1,col) + grid(row+1,col+1) + grid(row,col+1)+ grid(row-1,col+1);
               end
           end
        end
    end
    
    if grid(row,col) == 1
        if neigh == 2 || neigh == 3
           s = 1; 
        end
    else
        if neigh == 3
           s = 1; 
        end
    end
    
end

