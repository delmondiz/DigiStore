namespace DigiStoreWithMVC.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Digistoreuserid : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "DigistoreUserId", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "DigistoreUserId");
        }
    }
}
