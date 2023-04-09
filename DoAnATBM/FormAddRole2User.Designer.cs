namespace DoAnATBM
{
    partial class FormAddRole2User
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.textRole = new System.Windows.Forms.TextBox();
            this.textName = new System.Windows.Forms.TextBox();
            this.buttonAdd = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(58, 26);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(79, 16);
            this.label1.TabIndex = 0;
            this.label1.Text = "User Name:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(58, 66);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(70, 16);
            this.label2.TabIndex = 1;
            this.label2.Text = "RoleName:";
            // 
            // textPass
            // 
            this.textRole.Location = new System.Drawing.Point(165, 60);
            this.textRole.Name = "textRole";
            this.textRole.Size = new System.Drawing.Size(154, 22);
            this.textRole.TabIndex = 1;
            // 
            // textName
            // 
            this.textName.Location = new System.Drawing.Point(165, 20);
            this.textName.Name = "textName";
            this.textName.Size = new System.Drawing.Size(154, 22);
            this.textName.TabIndex = 5;
            // 
            // buttonAdd
            // 
            this.buttonAdd.Location = new System.Drawing.Point(130, 97);
            this.buttonAdd.Name = "buttonAdd";
            this.buttonAdd.Size = new System.Drawing.Size(100, 29);
            this.buttonAdd.TabIndex = 0;
            this.buttonAdd.Text = "Cấp Role";
            this.buttonAdd.Click += new System.EventHandler(this.buttonAddRole2User_Click);
            // 
            // FormAddRole2User
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(385, 147);
            this.Controls.Add(this.buttonAdd);
            this.Controls.Add(this.textRole);
            this.Controls.Add(this.textName);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "FormCAddRoleToUser";
            this.Text = "FormCAddRoleToUser";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FormCreateRole_FormClosing);
            this.Load += new System.EventHandler(this.FormAddRole2User_Load);
            this.ResumeLayout(false);
            this.PerformLayout();
            this.SuspendLayout();
            // 
            // FormAddRole2User
            // 
            

        }
         private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textRole;
        private System.Windows.Forms.TextBox textName;
        private System.Windows.Forms.Button buttonAdd;

        #endregion
    }
}