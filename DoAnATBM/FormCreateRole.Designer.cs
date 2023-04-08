namespace DoAnATBM
{
    partial class FormCreateRole
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
            this.textPass = new System.Windows.Forms.TextBox();
            this.textName = new System.Windows.Forms.TextBox();
            this.buttonCreate = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(58, 26);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(82, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "Role Name:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(58, 66);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(73, 17);
            this.label2.TabIndex = 1;
            this.label2.Text = "Password:";
            // 
            // textPass
            // 
            this.textPass.Location = new System.Drawing.Point(165, 60);
            this.textPass.Name = "textPass";
            this.textPass.Size = new System.Drawing.Size(154, 22);
            this.textPass.TabIndex = 1;
            // 
            // textName
            // 
            this.textName.Location = new System.Drawing.Point(165, 20);
            this.textName.Name = "textName";
            this.textName.Size = new System.Drawing.Size(154, 22);
            this.textName.TabIndex = 5;
            // 
            // buttonCreate
            // 
            this.buttonCreate.Location = new System.Drawing.Point(139, 112);
            this.buttonCreate.Name = "buttonCreate";
            this.buttonCreate.Size = new System.Drawing.Size(100, 23);
            this.buttonCreate.TabIndex = 0;
            this.buttonCreate.Text = "Tạo Role";
            this.buttonCreate.Click += new System.EventHandler(this.buttonCreate_Click);
            // 
            // FormCreateRole
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(385, 147);
            this.Controls.Add(this.buttonCreate);
            this.Controls.Add(this.textPass);
            this.Controls.Add(this.textName);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "FormCreateRole";
            this.Text = "FormCreateRole";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FormCreateRole_FormClosing);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textPass;
        private System.Windows.Forms.TextBox textName;
        private System.Windows.Forms.Button buttonCreate;
    }
}