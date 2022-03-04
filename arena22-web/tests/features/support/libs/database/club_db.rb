class Club

    def find_by_id(club_id)
        DATABASE.execute("SELECT * 
                          FROM   Clube 
                          WHERE  idClube = #{club_id}
                          ORDER  BY idClube DESC;")
    end

    def add_credits(club_id, value)
        DATABASE.execute("EXECUTE [dbo].[usp_SetClubeSaldo] #{club_id}, NULL, 'P', #{value}, NULL, NULL, 'Comissão Automatizado',
                          8, NULL, NULL, NULL, NULL;")
    end

    def add_diamonds(club_id, value)
        DATABASE.execute("EXECUTE [dbo].[usp_SetClubeSaldoDiamante] #{club_id}, NULL, 'C', #{value}, 'Bônus Automatizado', 8,
                          NULL, NULL;")
    end
end

